module FHIR
  class EnableWhenBehavior < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EnableWhenBehavior'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
