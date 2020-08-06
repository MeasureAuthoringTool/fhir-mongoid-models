module FHIR
  # fhir/address.rb
  class Address < Element
    include Mongoid::Document
    embeds_one :use, class_name: 'FHIR::AddressUse'    
    embeds_one :type, class_name: 'FHIR::AddressType'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    embeds_many :line, class_name: 'FHIR::PrimitiveString'    
    embeds_one :city, class_name: 'FHIR::PrimitiveString'    
    embeds_one :district, class_name: 'FHIR::PrimitiveString'    
    embeds_one :state, class_name: 'FHIR::PrimitiveString'    
    embeds_one :postalCode, class_name: 'FHIR::PrimitiveString'    
    embeds_one :country, class_name: 'FHIR::PrimitiveString'    
    embeds_one :period, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.use.nil? 
        result['use'] = self.use.value
        serialized = Extension.serializePrimitiveExtension(self.use)            
        result['_use'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.text.nil? 
        result['text'] = self.text.value
        serialized = Extension.serializePrimitiveExtension(self.text)            
        result['_text'] = serialized unless serialized.nil?
      end
      unless self.line.nil?  || !self.line.any? 
        result['line'] = self.line.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.line)                              
        result['_line'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.city.nil? 
        result['city'] = self.city.value
        serialized = Extension.serializePrimitiveExtension(self.city)            
        result['_city'] = serialized unless serialized.nil?
      end
      unless self.district.nil? 
        result['district'] = self.district.value
        serialized = Extension.serializePrimitiveExtension(self.district)            
        result['_district'] = serialized unless serialized.nil?
      end
      unless self.state.nil? 
        result['state'] = self.state.value
        serialized = Extension.serializePrimitiveExtension(self.state)            
        result['_state'] = serialized unless serialized.nil?
      end
      unless self.postalCode.nil? 
        result['postalCode'] = self.postalCode.value
        serialized = Extension.serializePrimitiveExtension(self.postalCode)            
        result['_postalCode'] = serialized unless serialized.nil?
      end
      unless self.country.nil? 
        result['country'] = self.country.value
        serialized = Extension.serializePrimitiveExtension(self.country)            
        result['_country'] = serialized unless serialized.nil?
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Address.new)
      result = self.superclass.transform_json(json_hash, target)
      result['use'] = AddressUse.transform_json(json_hash['use'], json_hash['_use']) unless json_hash['use'].nil?
      result['type'] = AddressType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?
      result['line'] = json_hash['line'].each_with_index.map do |var, i|
        extension_hash = json_hash['_line'] && json_hash['_line'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['line'].nil?
      result['city'] = PrimitiveString.transform_json(json_hash['city'], json_hash['_city']) unless json_hash['city'].nil?
      result['district'] = PrimitiveString.transform_json(json_hash['district'], json_hash['_district']) unless json_hash['district'].nil?
      result['state'] = PrimitiveString.transform_json(json_hash['state'], json_hash['_state']) unless json_hash['state'].nil?
      result['postalCode'] = PrimitiveString.transform_json(json_hash['postalCode'], json_hash['_postalCode']) unless json_hash['postalCode'].nil?
      result['country'] = PrimitiveString.transform_json(json_hash['country'], json_hash['_country']) unless json_hash['country'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
