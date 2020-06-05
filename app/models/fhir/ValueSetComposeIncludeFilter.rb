module FHIR
  class ValueSetComposeIncludeFilter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetComposeIncludeFilter'
    field :property, type:  # primitive
    embeds_one :_property, class_name: 'Extension'
    embeds_one :op, class_name: 'FilterOperator'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
