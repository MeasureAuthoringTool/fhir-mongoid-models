module FHIR
  # fhir/task_status.rb
  class TaskStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TaskStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = TaskStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
