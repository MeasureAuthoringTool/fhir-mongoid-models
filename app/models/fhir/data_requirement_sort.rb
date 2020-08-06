module FHIR
  # fhir/data_requirement_sort.rb
  class DataRequirementSort < Element
    include Mongoid::Document
    embeds_one :path, class_name: 'FHIR::PrimitiveString'    
    embeds_one :direction, class_name: 'FHIR::SortDirection'    
    
    def as_json(*args)
      result = super      
      unless self.path.nil? 
        result['path'] = self.path.value
        serialized = Extension.serializePrimitiveExtension(self.path)            
        result['_path'] = serialized unless serialized.nil?
      end
      unless self.direction.nil? 
        result['direction'] = self.direction.value
        serialized = Extension.serializePrimitiveExtension(self.direction)            
        result['_direction'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DataRequirementSort.new)
      result = self.superclass.transform_json(json_hash, target)
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?
      result['direction'] = SortDirection.transform_json(json_hash['direction'], json_hash['_direction']) unless json_hash['direction'].nil?

      result
    end
  end
end
