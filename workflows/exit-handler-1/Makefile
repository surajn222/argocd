submit-template-from-file:
	-/usr/local/bin/argo template delete workflow-template-whalesay-template -n argo
	-/usr/local/bin/argo template create deployment.yaml -n argo
	-/usr/local/bin/argo submit submit.yaml -n argo


#curl localhost:2746/api/v1/workflows/argo/submit \
#  -fs
#  -H "Authorization: $ARGO_TOKEN" \
#  -d '{"resourceKind": "WorkflowTemplate", "resourceName": "workflow-template-whalesay-template", "submitOptions": {"labels": "workflows.argoproj.io/workflow-template=workflow-template-whalesay-template"}}'

submit-template-from-commandline:
	-/usr/local/bin/argo template delete workflow-template-whalesay-template -n argo
	-/usr/local/bin/argo template create deployment.yaml -n argo
	-/usr/local/bin/argo submit --from wftmpl/workflow-template-whalesay-template -l workflows.argoproj.io/workflow-template=workflow-template-whalesay-template -n argo

submit-template-from-api:
	-/usr/local/bin/argo template delete workflow-template-whalesay-template -n argo
	-/usr/local/bin/argo template create deployment.yaml -n argo
#	-/usr/local/bin/kubectl create role jenkins --verb=list,update --resource=workflows.argoproj.io -n argo
#	-/usr/local/bin/kubectl create sa jenkins -n argo
#	-/usr/local/bin/kubectl create rolebinding jenkins --role=jenkins --serviceaccount=argo:jenkins -n argo
#	-SECRET=$(/usr/local/bin/kubectl get sa jenkins -n argo -o=jsonpath='{.secrets[0].name}')
#	-ARGO_TOKEN="Bearer $(/usr/local/bin/kubectl get secret $SECRET  -n argo -o=jsonpath='{.data.token}' | base64 --decode)"
#	-echo $ARGO_TOKEN
	#-/usr/bin/curl -k https://localhost:2746/api/v1/workflows/argo/submit -fs -H "Authorization: $ARGO_TOKEN" -d '{"resourceKind": "WorkflowTemplate", "resourceName": "workflow-template-whalesay-template", "submitOptions": {"labels": "workflows.argoproj.io/workflow-template=workflow-template-whalesay-template"}}'
	-/usr/bin/curl -k https://localhost:2746/api/v1/workflows/argo/submit -fs -d '{"resourceKind": "WorkflowTemplate", "resourceName": "workflow-template-whalesay-template", "submitOptions": {"labels": "workflows.argoproj.io/workflow-template=workflow-template-whalesay-template"}}'


submit-exthandler:
	-/usr/local/bin/argo template delete workflow-template-whalesay-template -n argo
	-/usr/local/bin/argo template create deployment.yaml -n argo
	-/usr/local/bin/argo submit ext-handler.yaml
