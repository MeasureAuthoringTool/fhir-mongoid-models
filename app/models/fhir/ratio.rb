module FHIR
  # fhir/ratio.rb
  class Ratio < Element
    include Mongoid::Document
    embeds_one :numerator, class_name: 'FHIR::Quantity'    
    embeds_one :denominator, class_name: 'FHIR::Quantity'    
    
    def as_json(*args)
      result = super      
      unless self.numerator.nil? 
        result['numerator'] = self.numerator.as_json(*args)
      end
      unless self.denominator.nil? 
        result['denominator'] = self.denominator.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Ratio.new)
      result = self.superclass.transform_json(json_hash, target)
      result['numerator'] = Quantity.transform_json(json_hash['numerator']) unless json_hash['numerator'].nil?
      result['denominator'] = Quantity.transform_json(json_hash['denominator']) unless json_hash['denominator'].nil?

      result
    end
  end
end
