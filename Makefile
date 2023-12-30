VERTEX_CHARTS := $(shell find . -maxdepth 1 -type d -name 'vertex-*' -exec basename {} \;)

update-all:
	helm repo update
	helm dependency update dind --skip-refresh
	@for chart in $(VERTEX_CHARTS); do helm dependency update $$chart --skip-refresh; done

install-all:
	@for chart in $(VERTEX_CHARTS); do helm install $$chart $$chart; done

uninstall-all:
	@for chart in $(VERTEX_CHARTS); do helm uninstall $$chart; done
