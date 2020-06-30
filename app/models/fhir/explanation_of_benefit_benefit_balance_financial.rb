module FHIR
  # fhir/explanation_of_benefit_benefit_balance_financial.rb
  class ExplanationOfBenefitBenefitBalanceFinancial < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitBenefitBalanceFinancial'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :allowedUnsignedInt, class_name: 'PrimitiveUnsignedInt'
    embeds_one :allowedString, class_name: 'PrimitiveString'
    embeds_one :allowedMoney, class_name: 'Money'
    embeds_one :usedUnsignedInt, class_name: 'PrimitiveUnsignedInt'
    embeds_one :usedMoney, class_name: 'Money'

    def self.transform_json(json_hash, target=ExplanationOfBenefitBenefitBalanceFinancial.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['allowedUnsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['allowedUnsignedInt'], json_hash['_allowedUnsignedInt']) unless json_hash['allowedUnsignedInt'].nil?      
      result['allowedString'] = PrimitiveString.transform_json(json_hash['allowedString'], json_hash['_allowedString']) unless json_hash['allowedString'].nil?      
      result['allowedMoney'] = Money.transform_json(json_hash['allowedMoney']) unless json_hash['allowedMoney'].nil?      
      result['usedUnsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['usedUnsignedInt'], json_hash['_usedUnsignedInt']) unless json_hash['usedUnsignedInt'].nil?      
      result['usedMoney'] = Money.transform_json(json_hash['usedMoney']) unless json_hash['usedMoney'].nil?      

      result
    end
  end
end
