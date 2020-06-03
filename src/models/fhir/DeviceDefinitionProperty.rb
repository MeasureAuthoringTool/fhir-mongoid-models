module FHIR
  class DeviceDefinitionProperty < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceDefinitionProperty'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :valueQuantity, class_name: 'Quantity'
    embeds_many :valueCode, class_name: 'CodeableConcept'
  end
end
