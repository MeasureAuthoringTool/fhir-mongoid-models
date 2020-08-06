module FHIR
  # fhir/data_requirement_date_filter.rb
  class DataRequirementDateFilter < Element
    include Mongoid::Document
    embeds_one :path, class_name: 'FHIR::PrimitiveString'    
    embeds_one :searchParam, class_name: 'FHIR::PrimitiveString'    
    embeds_one :valueDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :valuePeriod, class_name: 'FHIR::Period'    
    embeds_one :valueDuration, class_name: 'FHIR::Duration'    
    
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
      unless self.valueDateTime.nil?
        result['valueDateTime'] = self.valueDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueDateTime) 
        result['_valueDateTime'] = serialized unless serialized.nil?
      end          
      unless self.valuePeriod.nil?
        result['valuePeriod'] = self.valuePeriod.as_json(*args)                        
      end          
      unless self.valueDuration.nil?
        result['valueDuration'] = self.valueDuration.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DataRequirementDateFilter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?
      result['searchParam'] = PrimitiveString.transform_json(json_hash['searchParam'], json_hash['_searchParam']) unless json_hash['searchParam'].nil?
      result['valueDateTime'] = PrimitiveDateTime.transform_json(json_hash['valueDateTime'], json_hash['_valueDateTime']) unless json_hash['valueDateTime'].nil?
      result['valuePeriod'] = Period.transform_json(json_hash['valuePeriod']) unless json_hash['valuePeriod'].nil?
      result['valueDuration'] = Duration.transform_json(json_hash['valueDuration']) unless json_hash['valueDuration'].nil?

      result
    end
  end
end
