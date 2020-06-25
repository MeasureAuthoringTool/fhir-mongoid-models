module FHIR
  # fhir/action_condition_kind.rb
  class ActionConditionKind < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionConditionKind'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ActionConditionKind.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
