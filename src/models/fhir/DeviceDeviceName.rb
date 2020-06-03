module FHIR
  class DeviceDeviceName < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceDeviceName'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :type, class_name: 'DeviceNameType'
  end
end
