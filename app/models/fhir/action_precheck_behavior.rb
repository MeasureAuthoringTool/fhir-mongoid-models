module FHIR
  # fhir/action_precheck_behavior.rb
  class ActionPrecheckBehavior < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionPrecheckBehavior'
    field :value, type: String

    def self.transform_json(json_hash, target=ActionPrecheckBehavior.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
