{{/*
Expand the name of the chart. If nameOverride is provided in the values, that will be used as chart name.
*/}}
{{- define "config-example-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name used by the deployment object. 
If fullnameOverride is provided in values.yaml that will be used, else it checks for Chart name and
NameOverride and choosed the value based on the availability to check further if release name contains the 
temp stored name if so use this name, else use the combination of releasename and temp stored name. 
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "config-example-app.fullname" -}}
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
Below are the labels recommened by Kubernetes. Meaning below - 
app.kubernetes.io/name - The name of the application
app.kubernetes.io/instance - A unique name identifying the instance of an application (can be used for blue/green or to identify env specific instances etc)
app.kubernetes.io/version - The current version of the application
app.kubernetes.io/managed-by - The tool being used to manage the operation of an application

Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/
*/}}

{{/*
Concatenate chart name and chart version to be used for the chart label.
*/}}
{{- define "config-example-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "config-example-app.labels" -}}
helm.sh/chart: {{ include "config-example-app.chart" . }}
{{ include "config-example-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "config-example-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "config-example-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
