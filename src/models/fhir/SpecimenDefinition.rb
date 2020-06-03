module FHIR
  class SpecimenDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenDefinition'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :typeCollected, class_name: 'CodeableConcept'
    embeds_many :patientPreparation, class_name: 'CodeableConcept'
    field :timeAspect, type:  # primitive
    embeds_one :_timeAspect, class_name: 'Extension'
    embeds_many :collection, class_name: 'CodeableConcept'
    embeds_many :typeTested, class_name: 'SpecimenDefinitionTypeTested'
  end
end
