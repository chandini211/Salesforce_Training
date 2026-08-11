import { LightningElement, api } from 'lwc';

export default class StudentProfile extends LightningElement {

    @api recordId;

    showSuccess = false;
    showError = false;

    handleSuccess() {
        this.showSuccess = true;
        this.showError = false;

        setTimeout(() => {
            this.showSuccess = false;
        }, 3000);
    }

    handleError() {
        this.showSuccess = false;
        this.showError = true;
    }
}
