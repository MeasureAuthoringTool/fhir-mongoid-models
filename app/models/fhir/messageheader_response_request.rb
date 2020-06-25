module FHIR
  # fhir/messageheader_response_request.rb
  class MessageheaderResponseRequest < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageheaderResponseRequest'
    field :value, type: String

    def self.transform_json(json_hash)
      result = MessageheaderResponseRequest.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
