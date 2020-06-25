module FHIR
  # fhir/device_metric_calibration_type.rb
  class DeviceMetricCalibrationType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceMetricCalibrationType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = DeviceMetricCalibrationType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
