{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "wdwtables.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wdwtables.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "wdwtables.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "wdwtables.labels" -}}
helm.sh/chart: {{ include "wdwtables.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/name: "wdwtables"
{{- end -}}
# TODO: Include labels from values
{{/*
api specific labels
*/}}
{{- define "wdwtables.api.labels" -}}
{{- range $key, $val := .Values.api.labels -}}
{{ $key }}: {{ $val }}
{{- end }}
{{- end -}}

{{/*
messaging specific labels
*/}}
{{- define "wdwtables.messaging.labels" -}}
{{- range $key, $val := .Values.messaging.labels }}
{{ $key }}: {{ $val }}
{{- end }}
{{- end -}}

{{/*
uids specific labels
*/}}
{{- define "wdwtables.uids.labels" -}}
{{- range $key, $val := .Values.uids.labels }}
{{ $key }}: {{ $val }}
{{- end }}
{{- end -}}

{{/*
crawler-server specific labels
*/}}
{{- define "wdwtables.crawlerServer.labels" -}}
{{- range $key, $val := .Values.crawlerServer.labels }}
{{ $key }}: {{ $val }}
{{- end }}
{{- end -}}

{{/*
paidCrawler specific labels
*/}}
{{- define "wdwtables.paidCrawler.labels" -}}
{{- range $key, $val := .Values.paidCrawler.labels }}
{{ $key }}: {{ $val }}
{{- end }}
{{- end -}}

{{/*
freeCrawler specific labels
*/}}
{{- define "wdwtables.freeCrawler.labels" -}}
{{- range $key, $val := .Values.freeCrawler.labels }}
{{ $key }}: {{ $val }}
{{- end }}
{{- end -}}

{{/*
postgres specific labels
*/}}
{{- define "wdwtables.postgres.labels" -}}
{{- range $key, $val := .Values.postgres.labels }}
{{ $key }}: {{ $val }}
{{- end }}
{{- end -}}

{{/*
postgresBackup specific labels
*/}}
{{- define "wdwtables.postgresBackup.labels" -}}
{{- range $key, $val := .Values.postgresBackup.labels }}
{{ $key }}: {{ $val }}
{{- end }}
{{- end -}}