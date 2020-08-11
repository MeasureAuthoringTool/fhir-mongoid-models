module FHIR
  # fhir/count.rb
  class Count < Quantity
    include Mongoid::Document
    
    def as_json(*args)
      result = super      
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Count.new)
    
      result = self.superclass.transform_json(json_hash, target)

      result
    end
  end
end
