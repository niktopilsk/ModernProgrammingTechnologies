{{/* vim: set filetype=mustache: */}}

{{/*
Selector labels
*/}}
{{- define "helmapp.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Chart name and version as used by the chart label
*/}}
{{- define "helmapp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "helmapp.labels" -}}
helm.sh/chart: {{ include "helmapp.chart" . }}
{{ include "helmapp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Annotation to update pods on Secrets or ConfigMaps updates
*/}}
{{- define "helmapp.propertiesHash" -}}
{{- $secrets := include (print $.Template.BasePath "/secrets.yaml") . | sha256sum -}}
{{- $urlConfig := include (print $.Template.BasePath "/urls-config.yaml") . | sha256sum -}}
{{ print $secrets $urlConfig | sha256sum }}
{{- end -}}

{{/*
Name of the service account to use
*/}}
{{- define "helmapp.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-") .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Names of app tier components
*/}}
{{- define "helmapp.app.defaultName" -}}
{{- printf "app-%s" .Release.Name -}}
{{- end -}}

{{- define "helmapp.app.deployment.name" -}}
{{- default (include "helmapp.app.defaultName" .) .Values.app.deployment.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "helmapp.app.container.name" -}}
{{- default (include "helmapp.app.defaultName" .) .Values.app.container.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "helmapp.app.service.name" -}}
{{- default (include "helmapp.app.defaultName" .) .Values.app.service.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "helmapp.app.hpa.name" -}}
{{- default (include "helmapp.app.defaultName" .) .Values.app.hpa.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Names of mysql tier components
*/}}
{{- define "helmapp.mysql.defaultName" -}}
{{- printf "mysql-%s" .Release.Name -}}
{{- end -}}

{{- define "helmapp.mysql.deployment.name" -}}
{{- default (include "helmapp.mysql.defaultName" .) .Values.mysql.deployment.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "helmapp.mysql.container.name" -}}
{{- default (include "helmapp.mysql.defaultName" .) .Values.mysql.container.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "helmapp.mysql.service.name" -}}
{{- default (include "helmapp.mysql.defaultName" .) .Values.mysql.service.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "helmapp.mysql.hpa.name" -}}
{{- default (include "helmapp.mysql.defaultName" .) .Values.mysql.hpa.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Names of other components
*/}}
{{- define "helmapp.secrets.defaultName" -}}
{{- printf "secrets-%s" .Release.Name -}}
{{- end -}}

{{- define "helmapp.urlConfig.defaultName" -}}
{{- printf "url-config-%s" .Release.Name -}}
{{- end -}}

