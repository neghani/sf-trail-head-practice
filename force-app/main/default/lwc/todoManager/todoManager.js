import { LightningElement } from 'lwc';
import getAllProjects from "@salesforce/apex/ProjectManager.getAllProjects";

export default class TodoManager extends LightningElement {
    connectedCallback() {
        this.fetchProjects();
    }
    fetchProjects() {
        getAllProjects()
          .then(result => {
            if (result) {
              //update todos property with result
            console.log(result)
            }
          })
          .catch(error => {
            console.error("Error in fetching todo" + error);
          });
      }
}