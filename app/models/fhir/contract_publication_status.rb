module FHIR
  # fhir/contract_publication_status.rb
  class ContractPublicationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractPublicationStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ContractPublicationStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
