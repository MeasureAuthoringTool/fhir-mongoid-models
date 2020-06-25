module FHIR
  # fhir/communication_priority.rb
  class CommunicationPriority < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CommunicationPriority'
    field :value, type: String

    def self.transform_json(json_hash)
      result = CommunicationPriority.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
