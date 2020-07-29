module FHIR
  # fhir/coverage_eligibility_response_insurance_item_benefit.rb
  class CoverageEligibilityResponseInsuranceItemBenefit < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :allowedUnsignedInt, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :allowedString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :allowedMoney, class_name: 'FHIR::Money'    
    embeds_one :usedUnsignedInt, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :usedString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :usedMoney, class_name: 'FHIR::Money'    

    def self.transform_json(json_hash, target = CoverageEligibilityResponseInsuranceItemBenefit.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['allowedUnsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['allowedUnsignedInt'], json_hash['_allowedUnsignedInt']) unless json_hash['allowedUnsignedInt'].nil?
      result['allowedString'] = PrimitiveString.transform_json(json_hash['allowedString'], json_hash['_allowedString']) unless json_hash['allowedString'].nil?
      result['allowedMoney'] = Money.transform_json(json_hash['allowedMoney']) unless json_hash['allowedMoney'].nil?
      result['usedUnsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['usedUnsignedInt'], json_hash['_usedUnsignedInt']) unless json_hash['usedUnsignedInt'].nil?
      result['usedString'] = PrimitiveString.transform_json(json_hash['usedString'], json_hash['_usedString']) unless json_hash['usedString'].nil?
      result['usedMoney'] = Money.transform_json(json_hash['usedMoney']) unless json_hash['usedMoney'].nil?

      result
    end
  end
end
