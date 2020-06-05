module FHIR
  class CompartmentDefinitionResource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CompartmentDefinitionResource'
    embeds_one :code, class_name: 'ResourceType'
    field :param, type: Array # primitive
    embeds_many :_param, class_name: 'Extension'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
  end
end
