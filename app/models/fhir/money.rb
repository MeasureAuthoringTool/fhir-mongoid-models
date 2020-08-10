module FHIR
  # fhir/money.rb
  class Money < Element
    include Mongoid::Document
    embeds_one :value, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :currency, class_name: 'FHIR::CurrencyCode'    
    
    def as_json(*args)
      result = super      
      unless self.value.nil? 
        result['value'] = self.value.value
        serialized = Extension.serializePrimitiveExtension(self.value)            
        result['_value'] = serialized unless serialized.nil?
      end
      unless self.currency.nil? 
        result['currency'] = self.currency.value
        serialized = Extension.serializePrimitiveExtension(self.currency)            
        result['_currency'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Money.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = PrimitiveDecimal.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?
      result['currency'] = CurrencyCode.transform_json(json_hash['currency'], json_hash['_currency']) unless json_hash['currency'].nil?

      result
    end
  end
end
