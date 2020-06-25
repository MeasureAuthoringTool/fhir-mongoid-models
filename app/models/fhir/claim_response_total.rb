module FHIR
  # fhir/claim_response_total.rb
  class ClaimResponseTotal < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponseTotal'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'Money'

    def self.transform_json(json_hash)
      result = ClaimResponseTotal.new
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?      

      result
    end
  end
end
