module FHIR
  # fhir/eligibility_response_purpose.rb
  class EligibilityResponsePurpose < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EligibilityResponsePurpose'
    field :value, type: String

    def self.transform_json(json_hash)
      result = EligibilityResponsePurpose.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
