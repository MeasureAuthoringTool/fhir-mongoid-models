module FHIR
  # fhir/quantity_comparator.rb
  class QuantityComparator < PrimitiveCode
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

    def self.transform_json(json_hash, extension_hash, target = QuantityComparator.new)
    
      result = target
      unless extension_hash.nil?
        result['fhirId'] = extension_hash['id'] unless extension_hash['id'].nil?
        result['extension'] = extension_hash['extension'].map { |ext| Extension.transform_json(ext) }
      end
      result['value'] = json_hash
      result
    end
  end
end
