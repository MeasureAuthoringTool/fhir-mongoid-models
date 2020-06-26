module FHIR
  # fhir/device_metric_operational_status.rb
  class DeviceMetricOperationalStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceMetricOperationalStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = DeviceMetricOperationalStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
