module FHIR
  class DetectedIssue < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'DetectedIssue'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'DetectedIssueStatus'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :severity, class_name: 'DetectedIssueSeverity'
    embeds_one :patient, class_name: 'Reference'
    field :identifiedPrimitiveDateTime, type:  # primitive
    embeds_one :_identifiedPrimitiveDateTime, class_name: 'Extension'
    embeds_one :identifiedPeriod, class_name: 'Period'
    embeds_one :author, class_name: 'Reference'
    embeds_many :implicated, class_name: 'Reference'
    embeds_many :evidence, class_name: 'DetectedIssueEvidence'
    field :detail, type:  # primitive
    embeds_one :_detail, class_name: 'Extension'
    field :reference, type:  # primitive
    embeds_one :_reference, class_name: 'Extension'
    embeds_many :mitigation, class_name: 'DetectedIssueMitigation'
  end
end
