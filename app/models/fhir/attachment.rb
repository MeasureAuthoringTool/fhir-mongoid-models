module FHIR
  # fhir/attachment.rb
  class Attachment < Element
    include Mongoid::Document
    embeds_one :contentType, class_name: 'FHIR::MimeType'    
    embeds_one :language, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :data, class_name: 'FHIR::PrimitiveBase64Binary'    
    embeds_one :url, class_name: 'FHIR::PrimitiveUrl'    
    embeds_one :size, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :hash, class_name: 'FHIR::PrimitiveBase64Binary'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :creation, class_name: 'FHIR::PrimitiveDateTime'    
    
    def as_json(*args)
      result = super      
      unless self.contentType.nil? 
        result['contentType'] = self.contentType.value
        serialized = Extension.serializePrimitiveExtension(self.contentType)            
        result['_contentType'] = serialized unless serialized.nil?
      end
      unless self.language.nil? 
        result['language'] = self.language.value
        serialized = Extension.serializePrimitiveExtension(self.language)            
        result['_language'] = serialized unless serialized.nil?
      end
      unless self.data.nil? 
        result['data'] = self.data.value
        serialized = Extension.serializePrimitiveExtension(self.data)            
        result['_data'] = serialized unless serialized.nil?
      end
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.size.nil? 
        result['size'] = self.size.value
        serialized = Extension.serializePrimitiveExtension(self.size)            
        result['_size'] = serialized unless serialized.nil?
      end
      unless self.hash.nil? 
        result['hash'] = self.hash.value
        serialized = Extension.serializePrimitiveExtension(self.hash)            
        result['_hash'] = serialized unless serialized.nil?
      end
      unless self.title.nil? 
        result['title'] = self.title.value
        serialized = Extension.serializePrimitiveExtension(self.title)            
        result['_title'] = serialized unless serialized.nil?
      end
      unless self.creation.nil? 
        result['creation'] = self.creation.value
        serialized = Extension.serializePrimitiveExtension(self.creation)            
        result['_creation'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Attachment.new)
      result = self.superclass.transform_json(json_hash, target)
      result['contentType'] = MimeType.transform_json(json_hash['contentType'], json_hash['_contentType']) unless json_hash['contentType'].nil?
      result['language'] = PrimitiveCode.transform_json(json_hash['language'], json_hash['_language']) unless json_hash['language'].nil?
      result['data'] = PrimitiveBase64Binary.transform_json(json_hash['data'], json_hash['_data']) unless json_hash['data'].nil?
      result['url'] = PrimitiveUrl.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['size'] = PrimitiveUnsignedInt.transform_json(json_hash['size'], json_hash['_size']) unless json_hash['size'].nil?
      result['hash'] = PrimitiveBase64Binary.transform_json(json_hash['hash'], json_hash['_hash']) unless json_hash['hash'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['creation'] = PrimitiveDateTime.transform_json(json_hash['creation'], json_hash['_creation']) unless json_hash['creation'].nil?

      result
    end
  end
end
