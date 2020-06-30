module FHIR
  # fhir/device_metric_color.rb
  class DeviceMetricColor < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceMetricColor'
    field :value, type: String

    def self.transform_json(json_hash, target=DeviceMetricColor.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
