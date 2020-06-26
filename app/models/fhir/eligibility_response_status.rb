module FHIR
  # fhir/eligibility_response_status.rb
  class EligibilityResponseStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EligibilityResponseStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = EligibilityResponseStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
