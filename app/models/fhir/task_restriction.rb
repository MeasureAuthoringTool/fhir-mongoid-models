module FHIR
  # fhir/task_restriction.rb
  class TaskRestriction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TaskRestriction'
    embeds_one :repetitions, class_name: 'PrimitivePositiveInt'
    embeds_one :period, class_name: 'Period'
    embeds_many :recipient, class_name: 'Reference'

    def self.transform_json(json_hash, target=TaskRestriction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['repetitions'] = PrimitivePositiveInt.transform_json(json_hash['repetitions'], json_hash['_repetitions']) unless json_hash['repetitions'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['recipient'] = json_hash['recipient'].map { |var| Reference.transform_json(var) } unless json_hash['recipient'].nil?

      result
    end
  end
end
