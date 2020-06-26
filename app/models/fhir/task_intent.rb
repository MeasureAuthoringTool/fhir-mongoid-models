module FHIR
  # fhir/task_intent.rb
  class TaskIntent < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TaskIntent'
    field :value, type: String

    def self.transform_json(json_hash)
      result = TaskIntent.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
