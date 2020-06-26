module FHIR
  # fhir/action_selection_behavior.rb
  class ActionSelectionBehavior < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionSelectionBehavior'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ActionSelectionBehavior.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
