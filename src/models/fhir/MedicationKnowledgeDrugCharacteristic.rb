module FHIR
  class MedicationKnowledgeDrugCharacteristic < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeDrugCharacteristic'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :valueCodeableConcept, class_name: 'CodeableConcept'
    field :valuePrimitiveString, type:  # primitive
    embeds_one :_valuePrimitiveString, class_name: 'Extension'
    embeds_one :valueSimpleQuantity, class_name: 'SimpleQuantity'
    field :valuePrimitiveBase64Binary, type:  # primitive
    embeds_one :_valuePrimitiveBase64Binary, class_name: 'Extension'
  end
end
