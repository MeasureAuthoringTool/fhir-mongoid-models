module FHIR
  # fhir/explanation_of_benefit_benefit_balance_financial.rb
  class ExplanationOfBenefitBenefitBalanceFinancial < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitBenefitBalanceFinancial'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :allowedunsignedInt, class_name: 'PrimitiveUnsignedInt'
    embeds_one :allowedstring, class_name: 'PrimitiveString'
    embeds_one :allowedMoney, class_name: 'Money'
    embeds_one :usedunsignedInt, class_name: 'PrimitiveUnsignedInt'
    embeds_one :usedMoney, class_name: 'Money'

    def self.transform_json(json_hash)
      result = ExplanationOfBenefitBenefitBalanceFinancial.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['allowedunsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['allowedunsignedInt'], json_hash['_allowedunsignedInt']) unless json_hash['allowedunsignedInt'].nil?      
      result['allowedstring'] = PrimitiveString.transform_json(json_hash['allowedstring'], json_hash['_allowedstring']) unless json_hash['allowedstring'].nil?      
      result['allowedMoney'] = Money.transform_json(json_hash['allowedMoney']) unless json_hash['allowedMoney'].nil?      
      result['usedunsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['usedunsignedInt'], json_hash['_usedunsignedInt']) unless json_hash['usedunsignedInt'].nil?      
      result['usedMoney'] = Money.transform_json(json_hash['usedMoney']) unless json_hash['usedMoney'].nil?      

      result
    end
  end
end
