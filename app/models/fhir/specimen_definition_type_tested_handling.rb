module FHIR
  # fhir/specimen_definition_type_tested_handling.rb
  class SpecimenDefinitionTypeTestedHandling < BackboneElement
    include Mongoid::Document
    embeds_one :temperatureQualifier, class_name: 'FHIR::CodeableConcept'    
    embeds_one :temperatureRange, class_name: 'FHIR::Range'    
    embeds_one :maxDuration, class_name: 'FHIR::Duration'    
    embeds_one :instruction, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.temperatureQualifier.nil? 
        result['temperatureQualifier'] = self.temperatureQualifier.as_json(*args)
      end
      unless self.temperatureRange.nil? 
        result['temperatureRange'] = self.temperatureRange.as_json(*args)
      end
      unless self.maxDuration.nil? 
        result['maxDuration'] = self.maxDuration.as_json(*args)
      end
      unless self.instruction.nil? 
        result['instruction'] = self.instruction.value
        serialized = Extension.serializePrimitiveExtension(self.instruction)            
        result['_instruction'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SpecimenDefinitionTypeTestedHandling.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['temperatureQualifier'] = CodeableConcept.transform_json(json_hash['temperatureQualifier']) unless json_hash['temperatureQualifier'].nil?
      result['temperatureRange'] = Range.transform_json(json_hash['temperatureRange']) unless json_hash['temperatureRange'].nil?
      result['maxDuration'] = Duration.transform_json(json_hash['maxDuration']) unless json_hash['maxDuration'].nil?
      result['instruction'] = PrimitiveString.transform_json(json_hash['instruction'], json_hash['_instruction']) unless json_hash['instruction'].nil?

      result
    end
  end
end
