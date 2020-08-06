module FHIR
  # fhir/claim_accident.rb
  class ClaimAccident < BackboneElement
    include Mongoid::Document
    embeds_one :date, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :locationAddress, class_name: 'FHIR::Address'    
    embeds_one :locationReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.locationAddress.nil?
        result['locationAddress'] = self.locationAddress.as_json(*args)                        
      end          
      unless self.locationReference.nil?
        result['locationReference'] = self.locationReference.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ClaimAccident.new)
      result = self.superclass.transform_json(json_hash, target)
      result['date'] = PrimitiveDate.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['locationAddress'] = Address.transform_json(json_hash['locationAddress']) unless json_hash['locationAddress'].nil?
      result['locationReference'] = Reference.transform_json(json_hash['locationReference']) unless json_hash['locationReference'].nil?

      result
    end
  end
end
