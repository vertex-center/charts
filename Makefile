update-all:
	helm repo update
	helm dependency update
	helm dependency update dind --skip-refresh
	helm dependency update vertex-auth --skip-refresh
	helm dependency update vertex-logs --skip-refresh
	helm dependency update vertex-containers --skip-refresh

install-all:
	helm install vertex-auth vertex-auth
	helm install vertex-logs vertex-logs
	helm install vertex-containers vertex-containers

uninstall-all:
	helm uninstall vertex-auth
	helm uninstall vertex-logs
	helm uninstall vertex-containers
