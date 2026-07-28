{{- define "nimbus-document-service.name" -}}
nimbus-document-service
{{- end }}

{{- define "nimbus-document-service.fullname" -}}
{{ .Release.Name }}
{{- end }}

{{- define "nimbus-document-service.labels" -}}
app.kubernetes.io/name: {{ include "nimbus-document-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}