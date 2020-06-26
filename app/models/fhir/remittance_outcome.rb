module FHIR
  # fhir/remittance_outcome.rb
  class RemittanceOutcome < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RemittanceOutcome'
    field :value, type: String

    def self.transform_json(json_hash)
      result = RemittanceOutcome.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
