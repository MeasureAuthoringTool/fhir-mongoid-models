module FHIR
  class Population < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'Population'
    embeds_one :ageRange, class_name: 'Range'
    embeds_one :ageCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :gender, class_name: 'CodeableConcept'
    embeds_one :race, class_name: 'CodeableConcept'
    embeds_one :physiologicalCondition, class_name: 'CodeableConcept'
  end
end
