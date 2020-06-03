module FHIR
  class GraphDefinitionLinkTargetCompartment < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'GraphDefinitionLinkTargetCompartment'
    embeds_one :use, class_name: 'GraphCompartmentUse'
    embeds_one :code, class_name: 'CompartmentCode'
    embeds_one :rule, class_name: 'GraphCompartmentRule'
    field :expression, type:  # primitive
    embeds_one :_expression, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
  end
end
