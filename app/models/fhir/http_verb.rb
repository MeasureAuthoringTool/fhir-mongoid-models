module FHIR
  # fhir/http_verb.rb
  class HTTPVerb < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'HTTPVerb'
    field :value, type: String

    def self.transform_json(json_hash, target=HTTPVerb.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
