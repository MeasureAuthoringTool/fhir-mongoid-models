module FHIR
  # fhir/marketing_status.rb
  class MarketingStatus < BackboneElement
    include Mongoid::Document
    embeds_one :country, class_name: 'FHIR::CodeableConcept'    
    embeds_one :jurisdiction, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::CodeableConcept'    
    embeds_one :dateRange, class_name: 'FHIR::Period'    
    embeds_one :restoreDate, class_name: 'FHIR::PrimitiveDateTime'    
    
    def as_json(*args)
      result = super      
      unless self.country.nil? 
        result['country'] = self.country.as_json(*args)
      end
      unless self.jurisdiction.nil? 
        result['jurisdiction'] = self.jurisdiction.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.as_json(*args)
      end
      unless self.dateRange.nil? 
        result['dateRange'] = self.dateRange.as_json(*args)
      end
      unless self.restoreDate.nil? 
        result['restoreDate'] = self.restoreDate.value
        serialized = Extension.serializePrimitiveExtension(self.restoreDate)            
        result['_restoreDate'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MarketingStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['country'] = CodeableConcept.transform_json(json_hash['country']) unless json_hash['country'].nil?
      result['jurisdiction'] = CodeableConcept.transform_json(json_hash['jurisdiction']) unless json_hash['jurisdiction'].nil?
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['dateRange'] = Period.transform_json(json_hash['dateRange']) unless json_hash['dateRange'].nil?
      result['restoreDate'] = PrimitiveDateTime.transform_json(json_hash['restoreDate'], json_hash['_restoreDate']) unless json_hash['restoreDate'].nil?

      result
    end
  end
end
