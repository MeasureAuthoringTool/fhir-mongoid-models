module FHIR
  class GraphDefinitionLinkTarget < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'GraphDefinitionLinkTarget'
    embeds_one :type, class_name: 'ResourceType'
    field :params, type:  # primitive
    embeds_one :_params, class_name: 'Extension'
    field :profile, type:  # primitive
    embeds_one :_profile, class_name: 'Extension'
    embeds_many :compartment, class_name: 'GraphDefinitionLinkTargetCompartment'
    embeds_many :link, class_name: 'GraphDefinitionLink'
  end
end
