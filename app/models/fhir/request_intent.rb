module FHIR
  # fhir/request_intent.rb
  class RequestIntent < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RequestIntent'
    field :value, type: String

    def self.transform_json(json_hash)
      result = RequestIntent.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
