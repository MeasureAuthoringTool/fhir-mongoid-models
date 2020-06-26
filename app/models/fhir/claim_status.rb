module FHIR
  # fhir/claim_status.rb
  class ClaimStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ClaimStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
