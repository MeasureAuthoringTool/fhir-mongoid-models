module FHIR
  # fhir/communication_request_status.rb
  class CommunicationRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CommunicationRequestStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = CommunicationRequestStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
