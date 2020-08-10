module FHIR
  # fhir/signature.rb
  class Signature < Element
    include Mongoid::Document
    embeds_many :type, class_name: 'FHIR::Coding'    
    embeds_one :when, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :who, class_name: 'FHIR::Reference'    
    embeds_one :onBehalfOf, class_name: 'FHIR::Reference'    
    embeds_one :targetFormat, class_name: 'FHIR::MimeType'    
    embeds_one :sigFormat, class_name: 'FHIR::MimeType'    
    embeds_one :data, class_name: 'FHIR::PrimitiveBase64Binary'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      unless self.when.nil? 
        result['when'] = self.when.value
        serialized = Extension.serializePrimitiveExtension(self.when)            
        result['_when'] = serialized unless serialized.nil?
      end
      unless self.who.nil? 
        result['who'] = self.who.as_json(*args)
      end
      unless self.onBehalfOf.nil? 
        result['onBehalfOf'] = self.onBehalfOf.as_json(*args)
      end
      unless self.targetFormat.nil? 
        result['targetFormat'] = self.targetFormat.value
        serialized = Extension.serializePrimitiveExtension(self.targetFormat)            
        result['_targetFormat'] = serialized unless serialized.nil?
      end
      unless self.sigFormat.nil? 
        result['sigFormat'] = self.sigFormat.value
        serialized = Extension.serializePrimitiveExtension(self.sigFormat)            
        result['_sigFormat'] = serialized unless serialized.nil?
      end
      unless self.data.nil? 
        result['data'] = self.data.value
        serialized = Extension.serializePrimitiveExtension(self.data)            
        result['_data'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Signature.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = json_hash['type'].map { |var| Coding.transform_json(var) } unless json_hash['type'].nil?
      result['when'] = PrimitiveInstant.transform_json(json_hash['when'], json_hash['_when']) unless json_hash['when'].nil?
      result['who'] = Reference.transform_json(json_hash['who']) unless json_hash['who'].nil?
      result['onBehalfOf'] = Reference.transform_json(json_hash['onBehalfOf']) unless json_hash['onBehalfOf'].nil?
      result['targetFormat'] = MimeType.transform_json(json_hash['targetFormat'], json_hash['_targetFormat']) unless json_hash['targetFormat'].nil?
      result['sigFormat'] = MimeType.transform_json(json_hash['sigFormat'], json_hash['_sigFormat']) unless json_hash['sigFormat'].nil?
      result['data'] = PrimitiveBase64Binary.transform_json(json_hash['data'], json_hash['_data']) unless json_hash['data'].nil?

      result
    end
  end
end
