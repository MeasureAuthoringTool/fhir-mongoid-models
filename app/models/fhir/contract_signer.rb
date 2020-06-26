module FHIR
  # fhir/contract_signer.rb
  class ContractSigner < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractSigner'
    embeds_one :type, class_name: 'Coding'
    embeds_one :party, class_name: 'Reference'
    embeds_many :signature, class_name: 'Signature'

    def self.transform_json(json_hash)
      result = ContractSigner.new
      result['type'] = Coding.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['party'] = Reference.transform_json(json_hash['party']) unless json_hash['party'].nil?      
      result['signature'] = json_hash['signature'].map { |var| Signature.transform_json(var) } unless json_hash['signature'].nil?

      result
    end
  end
end
