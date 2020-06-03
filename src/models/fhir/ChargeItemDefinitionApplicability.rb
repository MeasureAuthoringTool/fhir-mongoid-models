module FHIR
  class ChargeItemDefinitionApplicability < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ChargeItemDefinitionApplicability'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :language, type:  # primitive
    embeds_one :_language, class_name: 'Extension'
    field :expression, type:  # primitive
    embeds_one :_expression, class_name: 'Extension'
  end
end
