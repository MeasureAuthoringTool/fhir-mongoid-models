module FHIR
  # fhir/event_capability_mode.rb
  class EventCapabilityMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EventCapabilityMode'
    field :value, type: String

    def self.transform_json(json_hash)
      result = EventCapabilityMode.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
