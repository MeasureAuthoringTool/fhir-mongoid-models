module FHIR
  # fhir/contract_term_offer_answer.rb
  class ContractTermOfferAnswer < BackboneElement
    include Mongoid::Document
    embeds_one :valueBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :valueDecimal, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :valueInteger, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :valueDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :valueDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :valueTime, class_name: 'FHIR::PrimitiveTime'    
    embeds_one :valueString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :valueUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :valueAttachment, class_name: 'FHIR::Attachment'    
    embeds_one :valueCoding, class_name: 'FHIR::Coding'    
    embeds_one :valueQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :valueReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.valueBoolean.nil?
        result['valueBoolean'] = self.valueBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueBoolean) 
        result['_valueBoolean'] = serialized unless serialized.nil?
      end          
      unless self.valueDecimal.nil?
        result['valueDecimal'] = self.valueDecimal.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueDecimal) 
        result['_valueDecimal'] = serialized unless serialized.nil?
      end          
      unless self.valueInteger.nil?
        result['valueInteger'] = self.valueInteger.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueInteger) 
        result['_valueInteger'] = serialized unless serialized.nil?
      end          
      unless self.valueDate.nil?
        result['valueDate'] = self.valueDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueDate) 
        result['_valueDate'] = serialized unless serialized.nil?
      end          
      unless self.valueDateTime.nil?
        result['valueDateTime'] = self.valueDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueDateTime) 
        result['_valueDateTime'] = serialized unless serialized.nil?
      end          
      unless self.valueTime.nil?
        result['valueTime'] = self.valueTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueTime) 
        result['_valueTime'] = serialized unless serialized.nil?
      end          
      unless self.valueString.nil?
        result['valueString'] = self.valueString.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueString) 
        result['_valueString'] = serialized unless serialized.nil?
      end          
      unless self.valueUri.nil?
        result['valueUri'] = self.valueUri.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueUri) 
        result['_valueUri'] = serialized unless serialized.nil?
      end          
      unless self.valueAttachment.nil?
        result['valueAttachment'] = self.valueAttachment.as_json(*args)                        
      end          
      unless self.valueCoding.nil?
        result['valueCoding'] = self.valueCoding.as_json(*args)                        
      end          
      unless self.valueQuantity.nil?
        result['valueQuantity'] = self.valueQuantity.as_json(*args)                        
      end          
      unless self.valueReference.nil?
        result['valueReference'] = self.valueReference.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ContractTermOfferAnswer.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?
      result['valueDecimal'] = PrimitiveDecimal.transform_json(json_hash['valueDecimal'], json_hash['_valueDecimal']) unless json_hash['valueDecimal'].nil?
      result['valueInteger'] = PrimitiveInteger.transform_json(json_hash['valueInteger'], json_hash['_valueInteger']) unless json_hash['valueInteger'].nil?
      result['valueDate'] = PrimitiveDate.transform_json(json_hash['valueDate'], json_hash['_valueDate']) unless json_hash['valueDate'].nil?
      result['valueDateTime'] = PrimitiveDateTime.transform_json(json_hash['valueDateTime'], json_hash['_valueDateTime']) unless json_hash['valueDateTime'].nil?
      result['valueTime'] = PrimitiveTime.transform_json(json_hash['valueTime'], json_hash['_valueTime']) unless json_hash['valueTime'].nil?
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?
      result['valueUri'] = PrimitiveUri.transform_json(json_hash['valueUri'], json_hash['_valueUri']) unless json_hash['valueUri'].nil?
      result['valueAttachment'] = Attachment.transform_json(json_hash['valueAttachment']) unless json_hash['valueAttachment'].nil?
      result['valueCoding'] = Coding.transform_json(json_hash['valueCoding']) unless json_hash['valueCoding'].nil?
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?

      result
    end
  end
end
