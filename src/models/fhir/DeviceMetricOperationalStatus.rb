module FHIR
  class DeviceMetricOperationalStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceMetricOperationalStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
