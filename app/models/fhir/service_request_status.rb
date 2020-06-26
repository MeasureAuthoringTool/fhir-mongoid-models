module FHIR
  # fhir/service_request_status.rb
  class ServiceRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ServiceRequestStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ServiceRequestStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
