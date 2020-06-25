module FHIR
  # fhir/contract_term_offer_party.rb
  class ContractTermOfferParty < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermOfferParty'
    embeds_many :reference, class_name: 'Reference'
    embeds_one :role, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = ContractTermOfferParty.new
      result['reference'] = json_hash['reference'].map { |var| Reference.transform_json(var) } unless json_hash['reference'].nil?
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?      

      result
    end
  end
end
