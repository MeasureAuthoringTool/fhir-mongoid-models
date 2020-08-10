module FHIR
  # fhir/data_requirement_code_filter.rb
  class DataRequirementCodeFilter < Element
    include Mongoid::Document
    embeds_one :path, class_name: 'FHIR::PrimitiveString'    
    embeds_one :searchParam, class_name: 'FHIR::PrimitiveString'    
    embeds_one :valueSet, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :code, class_name: 'FHIR::Coding'    
    
    def as_json(*args)
      result = super      
      unless self.path.nil? 
        result['path'] = self.path.value
        serialized = Extension.serializePrimitiveExtension(self.path)            
        result['_path'] = serialized unless serialized.nil?
      end
      unless self.searchParam.nil? 
        result['searchParam'] = self.searchParam.value
        serialized = Extension.serializePrimitiveExtension(self.searchParam)            
        result['_searchParam'] = serialized unless serialized.nil?
      end
      unless self.valueSet.nil? 
        result['valueSet'] = self.valueSet.value
        serialized = Extension.serializePrimitiveExtension(self.valueSet)            
        result['_valueSet'] = serialized unless serialized.nil?
      end
      unless self.code.nil?  || !self.code.any? 
        result['code'] = self.code.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DataRequirementCodeFilter.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?
      result['searchParam'] = PrimitiveString.transform_json(json_hash['searchParam'], json_hash['_searchParam']) unless json_hash['searchParam'].nil?
      result['valueSet'] = PrimitiveCanonical.transform_json(json_hash['valueSet'], json_hash['_valueSet']) unless json_hash['valueSet'].nil?
      result['code'] = json_hash['code'].map { |var| Coding.transform_json(var) } unless json_hash['code'].nil?

      result
    end
  end
end
