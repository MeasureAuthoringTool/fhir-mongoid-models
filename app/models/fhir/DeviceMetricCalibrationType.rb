module FHIR
  class DeviceMetricCalibrationType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceMetricCalibrationType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
