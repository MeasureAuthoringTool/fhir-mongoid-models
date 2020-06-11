module FHIR
  class MolecularSequenceReferenceSeq < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequenceReferenceSeq'
    embeds_one :chromosome, class_name: 'CodeableConcept'
    field :genomeBuild, type:  # primitive
    embeds_one :_genomeBuild, class_name: 'Extension'
    embeds_one :orientation, class_name: 'OrientationType'
    embeds_one :referenceSeqId, class_name: 'CodeableConcept'
    embeds_one :referenceSeqPointer, class_name: 'Reference'
    field :referenceSeqString, type:  # primitive
    embeds_one :_referenceSeqString, class_name: 'Extension'
    embeds_one :strand, class_name: 'StrandType'
    field :windowStart, type:  # primitive
    embeds_one :_windowStart, class_name: 'Extension'
    field :windowEnd, type:  # primitive
    embeds_one :_windowEnd, class_name: 'Extension'
  end
end
