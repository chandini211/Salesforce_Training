public with sharing class CandidateSyncQueueable
    implements Queueable, Database.AllowsCallouts {

    private Id applicationId;

    public CandidateSyncQueueable(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c applicationRecord = [
            SELECT Id,
                   Status__c,
                   Student__c,
                   Job__c,
                   Student__r.Name,
                   Student__r.Email__c,
                   Student__r.Branch__c,
                   Student__r.CGPA__c,
                   Job__r.Name,
                   Job__r.Add_Fields_Company_Name_Type_Text_Len__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        if (applicationRecord.Status__c != 'Selected') {
            return;
        }

        Map<String, Object> candidateData = new Map<String, Object>();

        candidateData.put(
            'studentId',
            applicationRecord.Student__c
        );

        candidateData.put(
            'name',
            applicationRecord.Student__r.Name
        );

        candidateData.put(
            'email',
            applicationRecord.Student__r.Email__c
        );

        candidateData.put(
            'branch',
            applicationRecord.Student__r.Branch__c
        );

        candidateData.put(
            'cgpa',
            applicationRecord.Student__r.CGPA__c
        );

        candidateData.put(
            'jobId',
            applicationRecord.Job__c
        );

        candidateData.put(
            'company',
            applicationRecord.Job__r.Add_Fields_Company_Name_Type_Text_Len__c
        );

        candidateData.put(
            'role',
            applicationRecord.Job__r.Name
        );

        candidateData.put(
            'selectionDate',
            Date.today().format()
        );

        HttpRequest request = new HttpRequest();

        request.setEndpoint(
            'callout:External_Recruitment_API/candidates'
        );

        request.setMethod('POST');

        request.setHeader(
            'Content-Type',
            'application/json'
        );

        request.setHeader(
            'Accept',
            'application/json'
        );

        request.setBody(
            JSON.serialize(candidateData)
        );

        Http http = new Http();

        HttpResponse response;

        try {

            response = http.send(request);

            Application__c updateRecord = new Application__c(
                Id = applicationRecord.Id,
                Last_Integration_Attempt__c = System.now()
            );

            if (
                response.getStatusCode() == 200 ||
                response.getStatusCode() == 201
            ) {

                Map<String, Object> responseData =
                    (Map<String, Object>) JSON.deserializeUntyped(
                        response.getBody()
                    );

                updateRecord.Integration_Status__c = 'Sent';

                if (responseData.containsKey('candidateId')) {

                    updateRecord.External_Candidate_Id__c =
                        String.valueOf(
                            responseData.get('candidateId')
                        );
                }

                updateRecord.Integration_Error__c = null;

            } else if (response.getStatusCode() == 400) {

                updateRecord.Integration_Status__c = 'Failed';

                updateRecord.Integration_Error__c =
                    'Bad Request: ' +
                    response.getBody();

            } else if (response.getStatusCode() == 401) {

                updateRecord.Integration_Status__c = 'Failed';

                updateRecord.Integration_Error__c =
                    'Authentication Failure: ' +
                    response.getBody();

            } else if (response.getStatusCode() == 403) {

                updateRecord.Integration_Status__c = 'Failed';

                updateRecord.Integration_Error__c =
                    'Forbidden: ' +
                    response.getBody();

            } else if (response.getStatusCode() >= 500) {

                updateRecord.Integration_Status__c =
                    'Retry Required';

                updateRecord.Integration_Error__c =
                    'Server Error: ' +
                    response.getBody();

            } else {

                updateRecord.Integration_Status__c = 'Failed';

                updateRecord.Integration_Error__c =
                    'Unexpected Response (' +
                    response.getStatusCode() +
                    '): ' +
                    response.getBody();
            }

            update updateRecord;

        } catch (Exception ex) {

            update new Application__c(
                Id = applicationRecord.Id,
                Integration_Status__c = 'Retry Required',
                Last_Integration_Attempt__c = System.now(),
                Integration_Error__c = ex.getMessage()
            );
        }
    }
}