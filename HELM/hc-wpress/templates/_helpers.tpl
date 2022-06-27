{{/*
Expand the name of the chart.
*/}}
{{- define "hc-wpress.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hc-wpress.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hc-wpress.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "mysql.labels" -}}
app: {{ .Values.mysqlDeployment.name }}
{{- end }}
{{- define "wpress.labels" -}}
app: {{ .Values.wpressDeployment.name }}
{{- end }}
{{- define "ns.labels" -}}
istio-injection: enabled
{{- end }}
{{- define "hc-wpress.labels" -}}
helm.sh/chart: {{ include "hc-wpress.chart" . }}
{{ include "hc-wpress.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "mysql.selectorLabels" -}}
app: {{ .Values.mysqlDeployment.name }}
tier: mysql
{{- end }}
{{- define "wpress.selectorLabels" -}}
app: {{ .Values.wpressDeployment.name }}
tier: frontend
{{- end }}
{{- define "hc-wpress.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hc-wpress.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "nfswpress.details" -}}
server: 128.199.17.25
path: /mnt/vol_wpress/k8s_wpress_share/wpress
{{- end }}
{{- define "nfsmysql.details" -}}
server: 128.199.17.25
path: /mnt/vol_wpress/k8s_wpress_share/mysql
{{- end }}



