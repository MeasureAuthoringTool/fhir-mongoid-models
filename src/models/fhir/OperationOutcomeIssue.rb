module FHIR
  class OperationOutcomeIssue < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationOutcomeIssue'
    embeds_one :severity, class_name: 'IssueSeverity'
    embeds_one :code, class_name: 'IssueType'
    embeds_one :details, class_name: 'CodeableConcept'
    field :diagnostics, type:  # primitive
    embeds_one :_diagnostics, class_name: 'Extension'
    field :location, type: Array # primitive
    embeds_many :_location, class_name: 'Extension'
    field :expression, type: Array # primitive
    embeds_many :_expression, class_name: 'Extension'
  end
end
