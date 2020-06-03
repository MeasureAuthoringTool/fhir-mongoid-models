module FHIR
  class TaskIntent < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TaskIntent'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
