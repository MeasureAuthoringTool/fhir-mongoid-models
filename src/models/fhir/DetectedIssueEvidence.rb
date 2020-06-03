module FHIR
  class DetectedIssueEvidence < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DetectedIssueEvidence'
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_many :detail, class_name: 'Reference'
  end
end
