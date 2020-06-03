module FHIR
  class MolecularSequenceVariant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequenceVariant'
    field :start, type:  # primitive
    embeds_one :_start, class_name: 'Extension'
    field :end, type:  # primitive
    embeds_one :_end, class_name: 'Extension'
    field :observedAllele, type:  # primitive
    embeds_one :_observedAllele, class_name: 'Extension'
    field :referenceAllele, type:  # primitive
    embeds_one :_referenceAllele, class_name: 'Extension'
    field :cigar, type:  # primitive
    embeds_one :_cigar, class_name: 'Extension'
    embeds_one :variantPointer, class_name: 'Reference'
  end
end
