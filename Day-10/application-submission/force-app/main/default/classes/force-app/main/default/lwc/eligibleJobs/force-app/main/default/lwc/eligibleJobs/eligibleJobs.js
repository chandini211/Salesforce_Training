import { LightningElement, api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import getEligibleJobs from '@salesforce/apex/EligibleJobsController.getEligibleJobs';
import applyForJob from '@salesforce/apex/EligibleJobsController.applyForJob';

export default class EligibleJobs extends LightningElement {
    @api recordId;

    jobs = [];
    error;

    @wire(getEligibleJobs, { studentId: '$recordId' })
    wiredJobs({ data, error }) {
        if (data) {
            this.jobs = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.jobs = [];
        }
    }

    get hasJobs() {
        return this.jobs.length > 0;
    }

    async handleApply(event) {
        const jobId = event.currentTarget.dataset.id;

        try {
            await applyForJob({
                studentId: this.recordId,
                jobId: jobId
            });

            this.showToast(
                'Application Submitted',
                'Your application has been submitted successfully.',
                'success'
            );

        } catch (error) {

            let message = 'Unable to submit the application.';

            if (error?.body?.message) {
                message = error.body.message;
            }

            this.showToast(
                'Application Failed',
                message,
                'error'
            );
        }
    }

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }
}
