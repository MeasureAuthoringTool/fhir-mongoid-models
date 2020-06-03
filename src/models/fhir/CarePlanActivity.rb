module FHIR
  class CarePlanActivity < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CarePlanActivity'
    embeds_many :outcomeCodeableConcept, class_name: 'CodeableConcept'
    embeds_many :outcomeReference, class_name: 'Reference'
    embeds_many :progress, class_name: 'Annotation'
    embeds_one :reference, class_name: 'Reference'
    embeds_one :detail, class_name: 'CarePlanActivityDetail'
  end
end
