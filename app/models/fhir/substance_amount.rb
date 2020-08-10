module FHIR
  # fhir/substance_amount.rb
  class SubstanceAmount < BackboneElement
    include Mongoid::Document
    embeds_one :amountQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :amountRange, class_name: 'FHIR::Range'    
    embeds_one :amountString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :amountType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amountText, class_name: 'FHIR::PrimitiveString'    
    embeds_one :referenceRange, class_name: 'FHIR::SubstanceAmountReferenceRange'    
    
    def as_json(*args)
      result = super      
      unless self.amountQuantity.nil?
        result['amountQuantity'] = self.amountQuantity.as_json(*args)                        
      end          
      unless self.amountRange.nil?
        result['amountRange'] = self.amountRange.as_json(*args)                        
      end          
      unless self.amountString.nil?
        result['amountString'] = self.amountString.value                        
        serialized = Extension.serializePrimitiveExtension(self.amountString) 
        result['_amountString'] = serialized unless serialized.nil?
      end          
      unless self.amountType.nil? 
        result['amountType'] = self.amountType.as_json(*args)
      end
      unless self.amountText.nil? 
        result['amountText'] = self.amountText.value
        serialized = Extension.serializePrimitiveExtension(self.amountText)            
        result['_amountText'] = serialized unless serialized.nil?
      end
      unless self.referenceRange.nil? 
        result['referenceRange'] = self.referenceRange.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceAmount.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['amountQuantity'] = Quantity.transform_json(json_hash['amountQuantity']) unless json_hash['amountQuantity'].nil?
      result['amountRange'] = Range.transform_json(json_hash['amountRange']) unless json_hash['amountRange'].nil?
      result['amountString'] = PrimitiveString.transform_json(json_hash['amountString'], json_hash['_amountString']) unless json_hash['amountString'].nil?
      result['amountType'] = CodeableConcept.transform_json(json_hash['amountType']) unless json_hash['amountType'].nil?
      result['amountText'] = PrimitiveString.transform_json(json_hash['amountText'], json_hash['_amountText']) unless json_hash['amountText'].nil?
      result['referenceRange'] = SubstanceAmountReferenceRange.transform_json(json_hash['referenceRange']) unless json_hash['referenceRange'].nil?

      result
    end
  end
end
