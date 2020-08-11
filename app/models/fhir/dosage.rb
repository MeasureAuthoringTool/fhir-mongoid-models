module FHIR
  # fhir/dosage.rb
  class Dosage < BackboneElement
    include Mongoid::Document
    embeds_one :sequence, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    embeds_many :additionalInstruction, class_name: 'FHIR::CodeableConcept'    
    embeds_one :patientInstruction, class_name: 'FHIR::PrimitiveString'    
    embeds_one :timing, class_name: 'FHIR::Timing'    
    embeds_one :asNeededBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :asNeededCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :site, class_name: 'FHIR::CodeableConcept'    
    embeds_one :route, class_name: 'FHIR::CodeableConcept'    
    embeds_one :method, class_name: 'FHIR::CodeableConcept'    
    embeds_many :doseAndRate, class_name: 'FHIR::DosageDoseAndRate'    
    embeds_one :maxDosePerPeriod, class_name: 'FHIR::Ratio'    
    embeds_one :maxDosePerAdministration, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :maxDosePerLifetime, class_name: 'FHIR::SimpleQuantity'    
    
    def as_json(*args)
      result = super      
      unless self.sequence.nil? 
        result['sequence'] = self.sequence.value
        serialized = Extension.serializePrimitiveExtension(self.sequence)            
        result['_sequence'] = serialized unless serialized.nil?
      end
      unless self.text.nil? 
        result['text'] = self.text.value
        serialized = Extension.serializePrimitiveExtension(self.text)            
        result['_text'] = serialized unless serialized.nil?
      end
      unless self.additionalInstruction.nil?  || !self.additionalInstruction.any? 
        result['additionalInstruction'] = self.additionalInstruction.map{ |x| x.as_json(*args) }
      end
      unless self.patientInstruction.nil? 
        result['patientInstruction'] = self.patientInstruction.value
        serialized = Extension.serializePrimitiveExtension(self.patientInstruction)            
        result['_patientInstruction'] = serialized unless serialized.nil?
      end
      unless self.timing.nil? 
        result['timing'] = self.timing.as_json(*args)
      end
      unless self.asNeededBoolean.nil?
        result['asNeededBoolean'] = self.asNeededBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.asNeededBoolean) 
        result['_asNeededBoolean'] = serialized unless serialized.nil?
      end          
      unless self.asNeededCodeableConcept.nil?
        result['asNeededCodeableConcept'] = self.asNeededCodeableConcept.as_json(*args)                        
      end          
      unless self.site.nil? 
        result['site'] = self.site.as_json(*args)
      end
      unless self.route.nil? 
        result['route'] = self.route.as_json(*args)
      end
      unless self.method.nil? 
        result['method'] = self.method.as_json(*args)
      end
      unless self.doseAndRate.nil?  || !self.doseAndRate.any? 
        result['doseAndRate'] = self.doseAndRate.map{ |x| x.as_json(*args) }
      end
      unless self.maxDosePerPeriod.nil? 
        result['maxDosePerPeriod'] = self.maxDosePerPeriod.as_json(*args)
      end
      unless self.maxDosePerAdministration.nil? 
        result['maxDosePerAdministration'] = self.maxDosePerAdministration.as_json(*args)
      end
      unless self.maxDosePerLifetime.nil? 
        result['maxDosePerLifetime'] = self.maxDosePerLifetime.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Dosage.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitiveInteger.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?
      result['additionalInstruction'] = json_hash['additionalInstruction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['additionalInstruction'].nil?
      result['patientInstruction'] = PrimitiveString.transform_json(json_hash['patientInstruction'], json_hash['_patientInstruction']) unless json_hash['patientInstruction'].nil?
      result['timing'] = Timing.transform_json(json_hash['timing']) unless json_hash['timing'].nil?
      result['asNeededBoolean'] = PrimitiveBoolean.transform_json(json_hash['asNeededBoolean'], json_hash['_asNeededBoolean']) unless json_hash['asNeededBoolean'].nil?
      result['asNeededCodeableConcept'] = CodeableConcept.transform_json(json_hash['asNeededCodeableConcept']) unless json_hash['asNeededCodeableConcept'].nil?
      result['site'] = CodeableConcept.transform_json(json_hash['site']) unless json_hash['site'].nil?
      result['route'] = CodeableConcept.transform_json(json_hash['route']) unless json_hash['route'].nil?
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?
      result['doseAndRate'] = json_hash['doseAndRate'].map { |var| DosageDoseAndRate.transform_json(var) } unless json_hash['doseAndRate'].nil?
      result['maxDosePerPeriod'] = Ratio.transform_json(json_hash['maxDosePerPeriod']) unless json_hash['maxDosePerPeriod'].nil?
      result['maxDosePerAdministration'] = SimpleQuantity.transform_json(json_hash['maxDosePerAdministration']) unless json_hash['maxDosePerAdministration'].nil?
      result['maxDosePerLifetime'] = SimpleQuantity.transform_json(json_hash['maxDosePerLifetime']) unless json_hash['maxDosePerLifetime'].nil?

      result
    end
  end
end
