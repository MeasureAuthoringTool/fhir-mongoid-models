module FHIR
  # fhir/trigger_type.rb
  class TriggerType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TriggerType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = TriggerType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
