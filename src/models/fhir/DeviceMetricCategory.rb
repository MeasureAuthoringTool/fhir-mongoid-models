module FHIR
  class DeviceMetricCategory < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceMetricCategory'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
