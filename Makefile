# Makefile

.PHONY: all install-drivers configure-containerd configure-crio kubelet-config apply-manifests clean

all: install-drivers configure-containerd configure-crio kubelet-config apply-manifests

install-drivers:
	./scripts/install-nvidia-drivers.sh

configure-containerd:
	./scripts/configure-containerd.sh

configure-crio:
	./scripts/configure-crio.sh

kubelet-config:
	./scripts/kubelet-config.sh

apply-manifests:
	kubectl apply -k manifests/

clean:
	kubectl delete -k manifests/