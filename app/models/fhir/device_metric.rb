module FHIR
  # fhir/device_metric.rb
  class DeviceMetric < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :unit, class_name: 'FHIR::CodeableConcept'    
    embeds_one :source, class_name: 'FHIR::Reference'    
    embeds_one :parent, class_name: 'FHIR::Reference'    
    embeds_one :operationalStatus, class_name: 'FHIR::DeviceMetricOperationalStatus'    
    embeds_one :color, class_name: 'FHIR::DeviceMetricColor'    
    embeds_one :category, class_name: 'FHIR::DeviceMetricCategory'    
    embeds_one :measurementPeriod, class_name: 'FHIR::Timing'    
    embeds_many :calibration, class_name: 'FHIR::DeviceMetricCalibration'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.unit.nil? 
        result['unit'] = self.unit.as_json(*args)
      end
      unless self.source.nil? 
        result['source'] = self.source.as_json(*args)
      end
      unless self.parent.nil? 
        result['parent'] = self.parent.as_json(*args)
      end
      unless self.operationalStatus.nil? 
        result['operationalStatus'] = self.operationalStatus.value
        serialized = Extension.serializePrimitiveExtension(self.operationalStatus)            
        result['_operationalStatus'] = serialized unless serialized.nil?
      end
      unless self.color.nil? 
        result['color'] = self.color.value
        serialized = Extension.serializePrimitiveExtension(self.color)            
        result['_color'] = serialized unless serialized.nil?
      end
      unless self.category.nil? 
        result['category'] = self.category.value
        serialized = Extension.serializePrimitiveExtension(self.category)            
        result['_category'] = serialized unless serialized.nil?
      end
      unless self.measurementPeriod.nil? 
        result['measurementPeriod'] = self.measurementPeriod.as_json(*args)
      end
      unless self.calibration.nil?  || !self.calibration.any? 
        result['calibration'] = self.calibration.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DeviceMetric.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['unit'] = CodeableConcept.transform_json(json_hash['unit']) unless json_hash['unit'].nil?
      result['source'] = Reference.transform_json(json_hash['source']) unless json_hash['source'].nil?
      result['parent'] = Reference.transform_json(json_hash['parent']) unless json_hash['parent'].nil?
      result['operationalStatus'] = DeviceMetricOperationalStatus.transform_json(json_hash['operationalStatus'], json_hash['_operationalStatus']) unless json_hash['operationalStatus'].nil?
      result['color'] = DeviceMetricColor.transform_json(json_hash['color'], json_hash['_color']) unless json_hash['color'].nil?
      result['category'] = DeviceMetricCategory.transform_json(json_hash['category'], json_hash['_category']) unless json_hash['category'].nil?
      result['measurementPeriod'] = Timing.transform_json(json_hash['measurementPeriod']) unless json_hash['measurementPeriod'].nil?
      result['calibration'] = json_hash['calibration'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          DeviceMetricCalibration.transform_json(var) 
        end
      } unless json_hash['calibration'].nil?

      result
    end
  end
end
