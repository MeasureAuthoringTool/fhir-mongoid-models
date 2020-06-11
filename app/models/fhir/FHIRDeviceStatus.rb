module FHIR
  class FHIRDeviceStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FHIRDeviceStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
