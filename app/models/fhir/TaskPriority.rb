module FHIR
  class TaskPriority < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TaskPriority'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
