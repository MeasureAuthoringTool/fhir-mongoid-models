module FHIR
  # fhir/request_intent.rb
  class RequestIntent < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RequestIntent'
    field :value, type: String

    def self.transform_json(json_hash, target=RequestIntent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
