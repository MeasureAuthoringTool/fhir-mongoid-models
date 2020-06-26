module FHIR
  # fhir/action_cardinality_behavior.rb
  class ActionCardinalityBehavior < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionCardinalityBehavior'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ActionCardinalityBehavior.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
