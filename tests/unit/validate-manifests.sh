#!/bin/bash

# Validate Kubernetes manifests in the manifests directory

MANIFESTS_DIR="../manifests"

# Function to validate YAML files
validate_yaml() {
    for file in "$MANIFESTS_DIR"/*.yaml; do
        if ! kubectl apply --dry-run=client -f "$file" > /dev/null 2>&1; then
            echo "Validation failed for $file"
            exit 1
        fi
    done
    echo "All manifests are valid."
}

# Run the validation
validate_yaml