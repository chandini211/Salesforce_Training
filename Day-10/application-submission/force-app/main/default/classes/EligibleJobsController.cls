public with sharing class EligibleJobsController {

    /*
     * ============================================================
     * GET ELIGIBLE JOBS
     * ============================================================
     *
     * A job is eligible when:
     *
     * 1. Student CGPA >= Job Minimum CGPA
     * 2. Student Branch = Job Eligible Branch
     * 3. Job Deadline >= Today
     *
     */
    @AuraEnabled(cacheable=true)
    public static List<Job__c> getEligibleJobs(Id studentId) {

        if (studentId == null) {
            return new List<Job__c>();
        }

        Student__c student = [
            SELECT Id,
                   CGPA__c,
                   Branch__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        if (student.CGPA__c == null || String.isBlank(student.Branch__c)) {
            return new List<Job__c>();
        }

        List<Job__c> jobs = [
            SELECT Id,
                   Name,
                   Minimum_CGPA__c,
                   Deadline__c,
                   Eligible_Branch__c,
                   Add_Fields_Company_Name_Type_Text_Len__c
            FROM Job__c
            WHERE Minimum_CGPA__c <= :student.CGPA__c
            ORDER BY Deadline__c ASC
        ];

        List<Job__c> eligibleJobs = new List<Job__c>();

        for (Job__c job : jobs) {

            Boolean branchEligible =
                !String.isBlank(job.Eligible_Branch__c) &&
                job.Eligible_Branch__c.trim()
                    .equalsIgnoreCase(student.Branch__c.trim());

            Boolean deadlineEligible =
                job.Deadline__c != null &&
                job.Deadline__c >= Date.today();

            if (branchEligible && deadlineEligible) {
                eligibleJobs.add(job);
            }
        }

        return eligibleJobs;
    }


    /*
     * ============================================================
     * APPLY FOR JOB
     * ============================================================
     *
     * Application workflow:
     *
     * Student
     *    ↓
     * Validate Student + Job
     *    ↓
     * Check Job Deadline
     *    ↓
     * Check Duplicate Application
     *    ↓
     * Create Application
     *    ↓
     * Return Application Id
     *
     * Status is intentionally not assigned here temporarily.
     * We are first confirming that Application__c can be inserted
     * successfully without any additional field dependency.
     *
     */
    @AuraEnabled
    public static Id applyForJob(Id studentId, Id jobId) {

        try {

            /*
             * ----------------------------------------------------
             * Validate Input
             * ----------------------------------------------------
             */
            if (studentId == null || jobId == null) {
                throw new AuraHandledException(
                    'Student and Job are required.'
                );
            }


            /*
             * ----------------------------------------------------
             * Get Selected Job
             * ----------------------------------------------------
             */
            Job__c job = [
                SELECT Id,
                       Name,
                       Deadline__c
                FROM Job__c
                WHERE Id = :jobId
                LIMIT 1
            ];


            /*
             * ----------------------------------------------------
             * Deadline Validation
             * ----------------------------------------------------
             */
            if (job.Deadline__c == null) {
                throw new AuraHandledException(
                    'This job does not have a valid application deadline.'
                );
            }

            if (job.Deadline__c < Date.today()) {
                throw new AuraHandledException(
                    'The application deadline for this job has expired.'
                );
            }


            /*
             * ----------------------------------------------------
             * Duplicate Application Check
             * ----------------------------------------------------
             */
            List<Application__c> existingApplications = [
                SELECT Id
                FROM Application__c
                WHERE Student__c = :studentId
                AND Job__c = :jobId
                LIMIT 1
            ];

            if (!existingApplications.isEmpty()) {
                throw new AuraHandledException(
                    'You have already applied for this job.'
                );
            }


            /*
             * ----------------------------------------------------
             * Create Application
             * ----------------------------------------------------
             */
            Application__c application = new Application__c();

            application.Student__c = studentId;
            application.Job__c = jobId;

            /*
             * Status__c is intentionally not set at this stage.
             * We will add it after confirming the Application
             * insertion works correctly.
             */

            insert application;

            return application.Id;


        } catch (AuraHandledException e) {

            throw e;


        } catch (Exception e) {

            System.debug(
                'APPLICATION ERROR: ' + e.getMessage()
            );

            System.debug(
                'APPLICATION ERROR TYPE: ' + e.getTypeName()
            );

            throw new AuraHandledException(
                'Application submission failed: ' +
                e.getTypeName() +
                ': ' +
                e.getMessage()
            );
        }
    }


    /*
     * ============================================================
     * GET MY APPLICATIONS
     * ============================================================
     *
     * Retrieves all applications belonging to the selected
     * student.
     *
     * Application Date is represented using Salesforce CreatedDate
     * because there is no custom Application Date field.
     *
     */
    @AuraEnabled(cacheable=true)
    public static List<Application__c> getMyApplications(
        Id studentId
    ) {

        if (studentId == null) {
            return new List<Application__c>();
        }

        return [
            SELECT
                Id,
                Name,
                Student__c,
                Job__c,
                Job__r.Name,
                Job__r.Minimum_CGPA__c,
                Job__r.Deadline__c,
                Job__r.Eligible_Branch__c,
                Status__c,
                CreatedDate
            FROM Application__c
            WHERE Student__c = :studentId
            ORDER BY CreatedDate DESC
        ];
    }
}
