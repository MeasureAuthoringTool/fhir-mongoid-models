module FHIR
  # fhir/claim_response_total.rb
  class ClaimResponseTotal < BackboneElement
    include Mongoid::Document
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amount, class_name: 'FHIR::Money'    
    
    def as_json(*args)
      result = super      
      unless self.category.nil? 
        result['category'] = self.category.as_json(*args)
      end
      unless self.amount.nil? 
        result['amount'] = self.amount.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ClaimResponseTotal.new)
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?

      result
    end
  end
end
