module FHIR
  # fhir/action_grouping_behavior.rb
  class ActionGroupingBehavior < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionGroupingBehavior'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ActionGroupingBehavior.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
