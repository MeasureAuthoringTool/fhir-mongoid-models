module FHIR
  class ConstraintSeverity < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConstraintSeverity'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
