# argocd

##Argo Installation:  
1. git clone https://github.com/surajn222/argocd.git   
2. cd argocd  
3. make install  
4. Access on https://localhost:2476  
  
  
##Argo Uninstall:
1. make clean


##To create an exit handler:

1.WorkflowTemplate:  
1.1. Make a yaml file of kind WorkflowTemplate  
1.2. Submit the template to argo to create the template on argo

2.Workflow:    
2.1. Make a yaml file of kind Workflow that includes:  
    2.1.1. Entrypoint:  
    2.1.2. Exithandler:  
        2.1.2.1 Steps:  
        2.1.2.2 Template for the steps:  
            2.1.2.1.1 Step1: DAG: Task: TemplateRef(Name of WorkflowTemplate): Template(Name of template in the Workflow Template)
4.Submit the above Workflow  
Check the workflows/exit-handler-1/Makefile

