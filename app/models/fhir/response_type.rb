module FHIR
  # fhir/response_type.rb
  class ResponseType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ResponseType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ResponseType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
