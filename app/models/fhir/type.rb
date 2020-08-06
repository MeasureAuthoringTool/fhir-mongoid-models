module FHIR
  # fhir/type.rb
  class Type
    include Mongoid::Document
    
    def as_json(*args)
      result = Hash.new      
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Type.new)
      result = target

      result
    end
  end
end
