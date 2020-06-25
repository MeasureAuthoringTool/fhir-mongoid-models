module FHIR
  # fhir/restful_capability_mode.rb
  class RestfulCapabilityMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RestfulCapabilityMode'
    field :value, type: String

    def self.transform_json(json_hash)
      result = RestfulCapabilityMode.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
