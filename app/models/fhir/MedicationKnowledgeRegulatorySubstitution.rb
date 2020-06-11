module FHIR
  class MedicationKnowledgeRegulatorySubstitution < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeRegulatorySubstitution'
    embeds_one :type, class_name: 'CodeableConcept'
    field :allowed, type:  # primitive
    embeds_one :_allowed, class_name: 'Extension'
  end
end
