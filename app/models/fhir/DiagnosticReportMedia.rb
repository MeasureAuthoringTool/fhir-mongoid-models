module FHIR
  class DiagnosticReportMedia < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DiagnosticReportMedia'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
    embeds_one :link, class_name: 'Reference'
  end
end
