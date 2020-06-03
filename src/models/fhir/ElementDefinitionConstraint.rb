module FHIR
  class ElementDefinitionConstraint < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinitionConstraint'
    field :key, type:  # primitive
    embeds_one :_key, class_name: 'Extension'
    field :requirements, type:  # primitive
    embeds_one :_requirements, class_name: 'Extension'
    embeds_one :severity, class_name: 'ConstraintSeverity'
    field :human, type:  # primitive
    embeds_one :_human, class_name: 'Extension'
    field :expression, type:  # primitive
    embeds_one :_expression, class_name: 'Extension'
    field :xpath, type:  # primitive
    embeds_one :_xpath, class_name: 'Extension'
    field :source, type:  # primitive
    embeds_one :_source, class_name: 'Extension'
  end
end
