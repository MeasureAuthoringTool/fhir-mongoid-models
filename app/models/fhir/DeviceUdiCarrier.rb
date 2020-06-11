module FHIR
  class DeviceUdiCarrier < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceUdiCarrier'
    field :deviceIdentifier, type:  # primitive
    embeds_one :_deviceIdentifier, class_name: 'Extension'
    field :issuer, type:  # primitive
    embeds_one :_issuer, class_name: 'Extension'
    field :jurisdiction, type:  # primitive
    embeds_one :_jurisdiction, class_name: 'Extension'
    field :carrierAIDC, type:  # primitive
    embeds_one :_carrierAIDC, class_name: 'Extension'
    field :carrierHRF, type:  # primitive
    embeds_one :_carrierHRF, class_name: 'Extension'
    embeds_one :entryType, class_name: 'UDIEntryType'
  end
end
