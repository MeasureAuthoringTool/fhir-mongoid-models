module FHIR
  # fhir/goal_lifecycle_status.rb
  class GoalLifecycleStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GoalLifecycleStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = GoalLifecycleStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
