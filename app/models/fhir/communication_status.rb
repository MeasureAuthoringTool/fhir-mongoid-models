module FHIR
  # fhir/communication_status.rb
  class CommunicationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CommunicationStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = CommunicationStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
