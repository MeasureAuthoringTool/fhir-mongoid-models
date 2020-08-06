module FHIR
  # fhir/substance_amount_reference_range.rb
  class SubstanceAmountReferenceRange < Element
    include Mongoid::Document
    embeds_one :lowLimit, class_name: 'FHIR::Quantity'    
    embeds_one :highLimit, class_name: 'FHIR::Quantity'    
    
    def as_json(*args)
      result = super      
      unless self.lowLimit.nil? 
        result['lowLimit'] = self.lowLimit.as_json(*args)
      end
      unless self.highLimit.nil? 
        result['highLimit'] = self.highLimit.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceAmountReferenceRange.new)
      result = self.superclass.transform_json(json_hash, target)
      result['lowLimit'] = Quantity.transform_json(json_hash['lowLimit']) unless json_hash['lowLimit'].nil?
      result['highLimit'] = Quantity.transform_json(json_hash['highLimit']) unless json_hash['highLimit'].nil?

      result
    end
  end
end
