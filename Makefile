install: install-argo get-password forward-port deploy-sample-workflow

install-argo:
	-echo "Make sure you are connected to the correct cluster"
	-echo "https://argoproj.github.io/argo-workflows/quick-start/"
	-/usr/local/bin/kubectl create namespace argo
	-/usr/local/bin/kubectl get namespaces
	-/usr/local/bin/kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj/argo-workflows/stable/manifests/quick-start-postgres.yaml
	-echo "Sleeping for 200 seconds"
	-sleep 200
	-/usr/local/bin/kubectl get all -n argo

get-password:
	-echo "The username is admin and the password is encoded in base64 "
	-/usr/local/bin/kubectl get secrets/argo-initial-admin-secret -o yaml  -n argo
	-echo "password is: "
	-/usr/local/bin/kubectl get secrets/argo-initial-admin-secret -n argo --template={{.data.password}} | base64 -D
	-echo "-n"

forward-port:
	-mkdir log
	-/usr/local/bin/kubectl -n argo port-forward services/argo-server 2746:2746 &> log/port-forward.log &
	-echo "Argo cluster is available at https://localhost:2746. Go to chrome://flags/#allow-insecure-localhost and enable Allow invalid certificates for localhost, if not accessible"

clean:
	-echo "Deleting Argo namespace"
	-/usr/local/bin/kubectl delete namespace argo
	-echo "Sleeping for 10 seconds"
	-sleep 10
	-/usr/local/bin/kubectl get namespaces

install-argocli:
	-echo "Installing argocli on Mac"
	-brew install argocd

test:
	-echo "Test"

deploy-sample-workflow:
	-echo "Deploying Sample Workflow"
	-/usr/local/bin/argo submit workflows/deployment.yaml

