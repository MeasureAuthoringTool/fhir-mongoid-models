module FHIR
  class MedicationKnowledgeCost < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeCost'
    embeds_one :type, class_name: 'CodeableConcept'
    field :source, type:  # primitive
    embeds_one :_source, class_name: 'Extension'
    embeds_one :cost, class_name: 'Money'
  end
end
