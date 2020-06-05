module FHIR
  class ConditionStage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConditionStage'
    embeds_one :summary, class_name: 'CodeableConcept'
    embeds_many :assessment, class_name: 'Reference'
    embeds_one :type, class_name: 'CodeableConcept'
  end
end
