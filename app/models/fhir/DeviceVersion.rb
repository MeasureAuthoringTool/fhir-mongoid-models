module FHIR
  class DeviceVersion < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceVersion'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :component, class_name: 'Identifier'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
