VERTEX_CHARTS := $(shell find . -maxdepth 1 -type d -name 'vertex-*' -exec basename {} \;)

install-deps:
	helm repo add bitnami https://charts.bitnami.com/bitnami

update-charts:
	helm repo update
	helm dependency update dind --skip-refresh
	@for chart in $(VERTEX_CHARTS); do \
  		echo "Updating $$chart..."; \
 		helm dependency update $$chart --skip-refresh; \
 	done

install-charts:
	@for chart in $(VERTEX_CHARTS); do \
  		echo "Installing $$chart..."; \
 		helm install $$chart $$chart; \
 	done

install-charts-with-wait:
	@for chart in $(VERTEX_CHARTS); do \
  		echo "Installing $$chart..."; \
 		helm install $$chart $$chart --wait; \
 	done

uninstall-charts:
	@for chart in $(VERTEX_CHARTS); do \
  		echo "Uninstalling $$chart..."; \
 		helm uninstall $$chart; \
 	done
