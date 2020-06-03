module FHIR
  class DeviceMetricColor < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceMetricColor'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
