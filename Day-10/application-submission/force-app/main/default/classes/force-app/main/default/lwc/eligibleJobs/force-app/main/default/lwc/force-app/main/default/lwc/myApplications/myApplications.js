import { LightningElement, api, wire } from 'lwc';
import getMyApplications from '@salesforce/apex/EligibleJobsController.getMyApplications';

export default class MyApplications extends LightningElement {
    @api recordId;

    applications = [];
    error;

    @wire(getMyApplications, { studentId: '$recordId' })
    wiredApplications({ data, error }) {
        if (data) {
            this.applications = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.applications = [];

            console.error('Error loading applications:', error);
        }
    }

    get hasApplications() {
        return this.applications.length > 0;
    }
}
