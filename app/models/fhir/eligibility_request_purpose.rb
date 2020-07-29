module FHIR
  # fhir/eligibility_request_purpose.rb
  class EligibilityRequestPurpose < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = EligibilityRequestPurpose.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
