module FHIR
  # fhir/medicinal_product_name_name_part.rb
  class MedicinalProductNameNamePart < BackboneElement
    include Mongoid::Document
    embeds_one :part, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::Coding'    
    
    def as_json(*args)
      result = super      
      unless self.part.nil? 
        result['part'] = self.part.value
        serialized = Extension.serializePrimitiveExtension(self.part)            
        result['_part'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductNameNamePart.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['part'] = PrimitiveString.transform_json(json_hash['part'], json_hash['_part']) unless json_hash['part'].nil?
      result['type'] = Coding.transform_json(json_hash['type']) unless json_hash['type'].nil?

      result
    end
  end
end
