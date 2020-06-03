module FHIR
  class MolecularSequenceStructureVariantOuter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequenceStructureVariantOuter'
    field :start, type:  # primitive
    embeds_one :_start, class_name: 'Extension'
    field :end, type:  # primitive
    embeds_one :_end, class_name: 'Extension'
  end
end
