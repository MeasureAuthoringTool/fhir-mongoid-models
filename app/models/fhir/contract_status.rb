module FHIR
  # fhir/contract_status.rb
  class ContractStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ContractStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
