module FHIR
  # fhir/device_metric_calibration_state.rb
  class DeviceMetricCalibrationState < Element
    include Mongoid::Document
    field :value, type: String

    def self.transform_json(json_hash, target = DeviceMetricCalibrationState.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
