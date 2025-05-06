# CNPG Helm Chart

This Helm chart deploys a CNPG (Cloud Native PostgreSQL) cluster on Kubernetes. It provides a customizable and scalable PostgreSQL database solution.

## Prerequisites

- Kubernetes 1.16+
- Helm 3.0+

## Installation

To install the chart, use the following command:

```bash
helm install <release-name> ./clusters
```

Replace `<release-name>` with your desired release name.

## Configuration

The following table lists the configurable parameters of the CNPG chart and their default values:

| Parameter                          | Description                                           | Default        |
|------------------------------------|-------------------------------------------------------|----------------|
| `instances`                        | Number of PostgreSQL instances in the cluster        | `3`            |
| `postgresql.parameters.max_worker_processes` | Maximum number of worker processes                   | `60`           |
| `storage.size`                     | Size of the storage for each instance                | `1Gi`          |

You can override these values by specifying them in a `values.yaml` file or directly in the command line using `--set`.

## Accessing the Database

After installation, you can access the PostgreSQL database using the credentials stored in the Kubernetes secret. Use the following command to retrieve the username and password:

```bash
kubectl get secret <release-name>-app -o jsonpath="{.data.username}" | base64 --decode
kubectl get secret <release-name>-app -o jsonpath="{.data.password}" | base64 --decode
```

## Uninstalling the Chart

To uninstall the chart, use the following command:

```bash
helm uninstall <release-name>
```

## Notes

For further details and advanced configurations, please refer to the documentation in the `templates/NOTES.txt` file.