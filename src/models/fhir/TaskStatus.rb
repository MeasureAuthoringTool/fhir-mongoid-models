module FHIR
  class TaskStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TaskStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
