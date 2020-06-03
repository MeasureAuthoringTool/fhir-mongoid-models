module FHIR
  class ImplementationGuideDefinitionResource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideDefinitionResource'
    embeds_one :reference, class_name: 'Reference'
    embeds_many :fhirVersion, class_name: 'FHIRVersion'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :examplePrimitiveBoolean, type:  # primitive
    embeds_one :_examplePrimitiveBoolean, class_name: 'Extension'
    field :examplePrimitiveCanonical, type:  # primitive
    embeds_one :_examplePrimitiveCanonical, class_name: 'Extension'
    field :groupingId, type:  # primitive
    embeds_one :_groupingId, class_name: 'Extension'
  end
end
