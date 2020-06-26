module FHIR
  # fhir/service_request_priority.rb
  class ServiceRequestPriority < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ServiceRequestPriority'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ServiceRequestPriority.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
