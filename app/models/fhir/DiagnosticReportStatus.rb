module FHIR
  class DiagnosticReportStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DiagnosticReportStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
