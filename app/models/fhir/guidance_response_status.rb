module FHIR
  # fhir/guidance_response_status.rb
  class GuidanceResponseStatus < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = GuidanceResponseStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
