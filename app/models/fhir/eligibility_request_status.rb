module FHIR
  # fhir/eligibility_request_status.rb
  class EligibilityRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EligibilityRequestStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = EligibilityRequestStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
