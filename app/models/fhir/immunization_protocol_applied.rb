module FHIR
  # fhir/immunization_protocol_applied.rb
  class ImmunizationProtocolApplied < BackboneElement
    include Mongoid::Document
    embeds_one :series, class_name: 'FHIR::PrimitiveString'    
    embeds_one :authority, class_name: 'FHIR::Reference'    
    embeds_many :targetDisease, class_name: 'FHIR::CodeableConcept'    
    embeds_one :doseNumberPositiveInt, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :doseNumberString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :seriesDosesPositiveInt, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :seriesDosesString, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.series.nil? 
        result['series'] = self.series.value
        serialized = Extension.serializePrimitiveExtension(self.series)            
        result['_series'] = serialized unless serialized.nil?
      end
      unless self.authority.nil? 
        result['authority'] = self.authority.as_json(*args)
      end
      unless self.targetDisease.nil?  || !self.targetDisease.any? 
        result['targetDisease'] = self.targetDisease.map{ |x| x.as_json(*args) }
      end
      unless self.doseNumberPositiveInt.nil?
        result['doseNumberPositiveInt'] = self.doseNumberPositiveInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.doseNumberPositiveInt) 
        result['_doseNumberPositiveInt'] = serialized unless serialized.nil?
      end          
      unless self.doseNumberString.nil?
        result['doseNumberString'] = self.doseNumberString.value                        
        serialized = Extension.serializePrimitiveExtension(self.doseNumberString) 
        result['_doseNumberString'] = serialized unless serialized.nil?
      end          
      unless self.seriesDosesPositiveInt.nil?
        result['seriesDosesPositiveInt'] = self.seriesDosesPositiveInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.seriesDosesPositiveInt) 
        result['_seriesDosesPositiveInt'] = serialized unless serialized.nil?
      end          
      unless self.seriesDosesString.nil?
        result['seriesDosesString'] = self.seriesDosesString.value                        
        serialized = Extension.serializePrimitiveExtension(self.seriesDosesString) 
        result['_seriesDosesString'] = serialized unless serialized.nil?
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImmunizationProtocolApplied.new)
      result = self.superclass.transform_json(json_hash, target)
      result['series'] = PrimitiveString.transform_json(json_hash['series'], json_hash['_series']) unless json_hash['series'].nil?
      result['authority'] = Reference.transform_json(json_hash['authority']) unless json_hash['authority'].nil?
      result['targetDisease'] = json_hash['targetDisease'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['targetDisease'].nil?
      result['doseNumberPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['doseNumberPositiveInt'], json_hash['_doseNumberPositiveInt']) unless json_hash['doseNumberPositiveInt'].nil?
      result['doseNumberString'] = PrimitiveString.transform_json(json_hash['doseNumberString'], json_hash['_doseNumberString']) unless json_hash['doseNumberString'].nil?
      result['seriesDosesPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['seriesDosesPositiveInt'], json_hash['_seriesDosesPositiveInt']) unless json_hash['seriesDosesPositiveInt'].nil?
      result['seriesDosesString'] = PrimitiveString.transform_json(json_hash['seriesDosesString'], json_hash['_seriesDosesString']) unless json_hash['seriesDosesString'].nil?

      result
    end
  end
end
