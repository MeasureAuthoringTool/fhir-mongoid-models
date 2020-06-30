module FHIR
  # fhir/request_priority.rb
  class RequestPriority < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RequestPriority'
    field :value, type: String

    def self.transform_json(json_hash, target=RequestPriority.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
