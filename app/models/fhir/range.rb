module FHIR
  # fhir/range.rb
  class Range < Element
    include Mongoid::Document
    embeds_one :low, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :high, class_name: 'FHIR::SimpleQuantity'    
    
    def as_json(*args)
      result = super      
      unless self.low.nil? 
        result['low'] = self.low.as_json(*args)
      end
      unless self.high.nil? 
        result['high'] = self.high.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Range.new)
      result = self.superclass.transform_json(json_hash, target)
      result['low'] = SimpleQuantity.transform_json(json_hash['low']) unless json_hash['low'].nil?
      result['high'] = SimpleQuantity.transform_json(json_hash['high']) unless json_hash['high'].nil?

      result
    end
  end
end
