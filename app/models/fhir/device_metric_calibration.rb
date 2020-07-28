module FHIR
  # fhir/device_metric_calibration.rb
  class DeviceMetricCalibration < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::DeviceMetricCalibrationType'    
    embeds_one :state, class_name: 'FHIR::DeviceMetricCalibrationState'    
    embeds_one :time, class_name: 'FHIR::PrimitiveInstant'    

    def self.transform_json(json_hash, target = DeviceMetricCalibration.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = DeviceMetricCalibrationType.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['state'] = DeviceMetricCalibrationState.transform_json(json_hash['state']) unless json_hash['state'].nil?
      result['time'] = PrimitiveInstant.transform_json(json_hash['time'], json_hash['_time']) unless json_hash['time'].nil?

      result
    end
  end
end
