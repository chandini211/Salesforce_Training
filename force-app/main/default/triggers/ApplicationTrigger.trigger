trigger ApplicationTrigger on Application__c (after update) {

    List<Id> selectedApplicationIds = new List<Id>();

    for (Application__c newApplication : Trigger.new) {

        Application__c oldApplication =
            Trigger.oldMap.get(newApplication.Id);

        if (
            newApplication.Status__c == 'Selected' &&
            oldApplication.Status__c != 'Selected'
        ) {
            selectedApplicationIds.add(newApplication.Id);
        }
    }

    for (Id applicationId : selectedApplicationIds) {
        System.enqueueJob(
            new CandidateSyncQueueable(applicationId)
        );
    }
}