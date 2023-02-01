public with sharing class ProjectManager {
   
    @AuraEnabled
    public static List<Project> getAllProjects() {
      List<SObject> projectsList = Database.query(
        'SELECT Id, Name, CreatedDate, Project_Id__c FROM Project__c WHERE CreatedDate = TODAY ORDER BY CreatedDate DESC'
      );
      return getProjects(projectsList);
    }
  
    //Wrap ToDo__c SObject into ToDo object
    public static List<Project> getProjects(List<SObject> objs) {
      List<Project> projects = new List<Project>();
      for (SObject obj : objs) {
        Project Project = new Project();
        Project.projectId = obj.Id;
        Project.projectName = String.valueOf(obj.get('Name'));
        Project.projectDate = Date.valueOf(obj.get('CreatedDate'));
        projects.add(Project);
      }
  
      return projects;
    }
  
    //Wrapper Class to represent a ToDo Item
    public class Project {
      @AuraEnabled
      public String projectId;
      @AuraEnabled
      public String projectName;
      @AuraEnabled
      public Date projectDate;
      
    }
      
}