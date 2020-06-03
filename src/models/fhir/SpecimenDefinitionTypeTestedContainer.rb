module FHIR
  class SpecimenDefinitionTypeTestedContainer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenDefinitionTypeTestedContainer'
    embeds_one :material, class_name: 'CodeableConcept'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :cap, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :capacity, class_name: 'SimpleQuantity'
    embeds_one :minimumVolumeSimpleQuantity, class_name: 'SimpleQuantity'
    field :minimumVolumePrimitiveString, type:  # primitive
    embeds_one :_minimumVolumePrimitiveString, class_name: 'Extension'
    embeds_many :additive, class_name: 'SpecimenDefinitionTypeTestedContainerAdditive'
    field :preparation, type:  # primitive
    embeds_one :_preparation, class_name: 'Extension'
  end
end
