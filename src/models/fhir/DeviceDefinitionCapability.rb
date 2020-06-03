module FHIR
  class DeviceDefinitionCapability < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceDefinitionCapability'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :description, class_name: 'CodeableConcept'
  end
end
