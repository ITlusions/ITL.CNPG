{{/*
Common template helpers for the CNPG Helm chart.
*/}}

{{- define "cnpg.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cnpg.labels" -}}
app: {{ include "cnpg.fullname" . }}
release: {{ .Release.Name }}
chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{- define "cnpg.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- else -}}
{{ .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}