module FHIR
  # fhir/claim_response_item_adjudication.rb
  class ClaimResponseItemAdjudication < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponseItemAdjudication'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :reason, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'Money'
    embeds_one :value, class_name: 'PrimitiveDecimal'

    def self.transform_json(json_hash)
      result = ClaimResponseItemAdjudication.new
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['reason'] = CodeableConcept.transform_json(json_hash['reason']) unless json_hash['reason'].nil?      
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?      
      result['value'] = PrimitiveDecimal.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      

      result
    end
  end
end
