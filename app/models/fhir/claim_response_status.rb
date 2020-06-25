module FHIR
  # fhir/claim_response_status.rb
  class ClaimResponseStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponseStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ClaimResponseStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
