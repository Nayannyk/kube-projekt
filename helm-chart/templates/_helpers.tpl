{{- define "kube-projekt.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kube-projekt.labels" -}}
app.kubernetes.io/name: {{ include "kube-projekt.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

