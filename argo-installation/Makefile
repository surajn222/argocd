install: install-argo get-password forward-port

install-argo:
	-echo "Make sure you are connected to the correct cluster"
	-/usr/local/bin/kubectl create namespace argocd
	-/usr/local/bin/kubectl get namespaces
	-/usr/local/bin/kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
	-echo "Sleeping for 200 seconds"
	-sleep 200
	-/usr/local/bin/kubectl get all -n argocd

get-password:
	-echo "The username is admin and the password is encoded in base64 "
	-/usr/local/bin/kubectl get secrets/argocd-initial-admin-secret -o yaml  -n argocd
	-echo "password is: "
	-/usr/local/bin/kubectl get secrets/argocd-initial-admin-secret -n argocd --template={{.data.password}} | base64 -D
	-echo "        "

forward-port:
	-/usr/local/bin/kubectl -n argocd port-forward services/argocd-server 8080:80 &> port-forward.log &
	-echo "Argo cluster is available at localhost:8080"

clean:
	-echo "Deleting Argo namespace"
	-/usr/local/bin/kubectl delete namespace argocd
	-echo "Sleeping for 10 seconds"
	-sleep 10
	-/usr/local/bin/kubectl get namespaces

test:
	-echo "Test"