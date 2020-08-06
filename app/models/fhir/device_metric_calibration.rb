module FHIR
  # fhir/device_metric_calibration.rb
  class DeviceMetricCalibration < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::DeviceMetricCalibrationType'    
    embeds_one :state, class_name: 'FHIR::DeviceMetricCalibrationState'    
    embeds_one :time, class_name: 'FHIR::PrimitiveInstant'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.state.nil? 
        result['state'] = self.state.value
        serialized = Extension.serializePrimitiveExtension(self.state)            
        result['_state'] = serialized unless serialized.nil?
      end
      unless self.time.nil? 
        result['time'] = self.time.value
        serialized = Extension.serializePrimitiveExtension(self.time)            
        result['_time'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DeviceMetricCalibration.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = DeviceMetricCalibrationType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['state'] = DeviceMetricCalibrationState.transform_json(json_hash['state'], json_hash['_state']) unless json_hash['state'].nil?
      result['time'] = PrimitiveInstant.transform_json(json_hash['time'], json_hash['_time']) unless json_hash['time'].nil?

      result
    end
  end
end
