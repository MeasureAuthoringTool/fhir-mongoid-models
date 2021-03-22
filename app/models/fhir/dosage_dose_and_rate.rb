module FHIR
  # fhir/dosage_dose_and_rate.rb
  class DosageDoseAndRate < Element
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :doseRange, class_name: 'FHIR::Range'    
    embeds_one :doseQuantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :rateRatio, class_name: 'FHIR::Ratio'    
    embeds_one :rateRange, class_name: 'FHIR::Range'    
    embeds_one :rateQuantity, class_name: 'FHIR::SimpleQuantity'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.doseRange.nil?
        result['doseRange'] = self.doseRange.as_json(*args)                        
      end          
      unless self.doseQuantity.nil?
        result['doseQuantity'] = self.doseQuantity.as_json(*args)                        
      end          
      unless self.rateRatio.nil?
        result['rateRatio'] = self.rateRatio.as_json(*args)                        
      end          
      unless self.rateRange.nil?
        result['rateRange'] = self.rateRange.as_json(*args)                        
      end          
      unless self.rateQuantity.nil?
        result['rateQuantity'] = self.rateQuantity.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DosageDoseAndRate.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['doseRange'] = Range.transform_json(json_hash['doseRange']) unless json_hash['doseRange'].nil?
      result['doseQuantity'] = SimpleQuantity.transform_json(json_hash['doseQuantity']) unless json_hash['doseQuantity'].nil?
      result['rateRatio'] = Ratio.transform_json(json_hash['rateRatio']) unless json_hash['rateRatio'].nil?
      result['rateRange'] = Range.transform_json(json_hash['rateRange']) unless json_hash['rateRange'].nil?
      result['rateQuantity'] = SimpleQuantity.transform_json(json_hash['rateQuantity']) unless json_hash['rateQuantity'].nil?

      result
    end
  end
end
