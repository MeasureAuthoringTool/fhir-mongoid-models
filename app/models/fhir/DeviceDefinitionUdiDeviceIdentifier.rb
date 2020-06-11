module FHIR
  class DeviceDefinitionUdiDeviceIdentifier < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceDefinitionUdiDeviceIdentifier'
    field :deviceIdentifier, type:  # primitive
    embeds_one :_deviceIdentifier, class_name: 'Extension'
    field :issuer, type:  # primitive
    embeds_one :_issuer, class_name: 'Extension'
    field :jurisdiction, type:  # primitive
    embeds_one :_jurisdiction, class_name: 'Extension'
  end
end
