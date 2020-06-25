module FHIR
  # fhir/endpoint_status.rb
  class EndpointStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EndpointStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = EndpointStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
