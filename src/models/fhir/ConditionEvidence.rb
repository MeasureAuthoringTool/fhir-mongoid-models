module FHIR
  class ConditionEvidence < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConditionEvidence'
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_many :detail, class_name: 'Reference'
  end
end
