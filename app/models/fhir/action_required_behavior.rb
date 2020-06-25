module FHIR
  # fhir/action_required_behavior.rb
  class ActionRequiredBehavior < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionRequiredBehavior'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ActionRequiredBehavior.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
