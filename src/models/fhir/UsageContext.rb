module FHIR
  class UsageContext < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'UsageContext'
    embeds_one :code, class_name: 'Coding'
    embeds_one :valueCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueRange, class_name: 'Range'
    embeds_one :valueReference, class_name: 'Reference'
  end
end
