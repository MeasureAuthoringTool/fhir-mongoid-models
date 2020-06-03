module FHIR
  class MolecularSequenceStructureVariant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequenceStructureVariant'
    embeds_one :variantType, class_name: 'CodeableConcept'
    field :exact, type:  # primitive
    embeds_one :_exact, class_name: 'Extension'
    field :length, type:  # primitive
    embeds_one :_length, class_name: 'Extension'
    embeds_one :outer, class_name: 'MolecularSequenceStructureVariantOuter'
    embeds_one :inner, class_name: 'MolecularSequenceStructureVariantInner'
  end
end
