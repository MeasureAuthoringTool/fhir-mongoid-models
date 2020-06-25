module FHIR
  # fhir/eligibility_request_purpose.rb
  class EligibilityRequestPurpose < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EligibilityRequestPurpose'
    field :value, type: String

    def self.transform_json(json_hash)
      result = EligibilityRequestPurpose.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
