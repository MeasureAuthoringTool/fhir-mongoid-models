module FHIR
  # fhir/event_timing.rb
  class EventTiming < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EventTiming'
    field :value, type: String

    def self.transform_json(json_hash)
      result = EventTiming.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
