module FHIR
  # fhir/task_priority.rb
  class TaskPriority < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TaskPriority'
    field :value, type: String

    def self.transform_json(json_hash)
      result = TaskPriority.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
