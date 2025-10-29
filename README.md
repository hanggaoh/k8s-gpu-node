# Kubernetes GPU Node Setup

This project provides a comprehensive setup for configuring a Kubernetes node with NVIDIA GPU drivers and container runtimes. It includes scripts, manifests, and automation tools to facilitate the deployment and management of GPU resources in a Kubernetes environment.

## Project Structure

- **manifests/**: Contains Kubernetes manifests for deploying the NVIDIA device plugin and GPU operator.
  - **daemonsets/**: DaemonSets for managing GPU resources.
    - `nvidia-device-plugin.yaml`: DaemonSet for the NVIDIA device plugin.
    - `gpu-operator.yaml`: DaemonSet for the GPU operator.
  - **runtime/**: Configuration files for container runtimes.
    - `containerd-config.toml`: Configuration for containerd runtime.
    - `crio.conf`: Configuration for CRI-O runtime.
  - `kustomization.yaml`: Kustomize configuration for customizing resources.

- **scripts/**: Shell scripts for installing and configuring NVIDIA drivers and runtimes.
  - `install-nvidia-drivers.sh`: Installs NVIDIA GPU drivers.
  - `configure-containerd.sh`: Configures containerd for NVIDIA GPUs.
  - `configure-crio.sh`: Configures CRI-O for NVIDIA GPUs.
  - `kubelet-config.sh`: Configures kubelet for GPU resource management.

- **terraform/**: Terraform configurations for provisioning infrastructure.
  - `main.tf`: Main Terraform configuration file.
  - `variables.tf`: Variables used in the Terraform configuration.

- **packer/**: Packer configuration for creating machine images.
  - `gpu-image.json`: Packer configuration for GPU-enabled images.

- **ansible/**: Ansible playbooks and roles for automating the setup.
  - **playbooks/**: Contains playbooks for setup automation.
    - `gpu-node.yml`: Playbook for setting up a GPU node.
  - **roles/**: Ansible roles for NVIDIA setup.
    - **nvidia/**: Role for NVIDIA driver installation.
      - **tasks/**: Tasks for the role.
        - `main.yml`: Main tasks for installing NVIDIA drivers.
      - **templates/**: Templates for configuration files.
        - `nvidia.conf.j2`: Jinja2 template for NVIDIA configuration.

- **charts/**: Helm charts for deploying the NVIDIA operator.
  - **nvidia-operator/**: Helm chart for the NVIDIA operator.
    - `Chart.yaml`: Metadata for the Helm chart.

- **tests/**: Contains tests for validating the setup.
  - **integration/**: Integration tests for GPU-enabled pods.
    - `test-gpu-pod.yaml`: Test for deploying a GPU-enabled pod.
  - **unit/**: Unit tests for validating manifests.
    - `validate-manifests.sh`: Script for validating Kubernetes manifests.

- **docs/**: Documentation for the project.
  - `architecture.md`: Architecture overview of the setup.
  - `prerequisites.md`: Prerequisites for setting up the node.
  - `troubleshooting.md`: Troubleshooting tips for common issues.

- **.github/**: GitHub workflows for CI/CD.
  - **workflows/**: Contains CI workflow files.
    - `ci.yml`: CI workflow configuration.

- **.gitignore**: Specifies files to ignore in Git.

- **Makefile**: Commands for building and managing the project.

- **LICENSE**: Licensing information for the project.

## Getting Started

1. **Prerequisites**: Ensure that you have the necessary hardware and software prerequisites as outlined in `docs/prerequisites.md`.

2. **Installation**: Use the provided scripts in the `scripts/` directory to install NVIDIA drivers and configure the container runtimes.

3. **Deployment**: Apply the Kubernetes manifests in the `manifests/` directory to deploy the NVIDIA device plugin and GPU operator.

4. **Testing**: Run the tests in the `tests/` directory to validate the setup.

5. **Documentation**: Refer to the `docs/` directory for detailed documentation on architecture, troubleshooting, and more.

## Contributing

Contributions are welcome! Please follow the guidelines in the repository for submitting issues and pull requests.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.