module FHIR
  class DeviceRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceRequestStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
