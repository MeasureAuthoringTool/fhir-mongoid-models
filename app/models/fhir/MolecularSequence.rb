module FHIR
  class MolecularSequence < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequence'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'SequenceType'
    field :coordinateSystem, type:  # primitive
    embeds_one :_coordinateSystem, class_name: 'Extension'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :specimen, class_name: 'Reference'
    embeds_one :device, class_name: 'Reference'
    embeds_one :performer, class_name: 'Reference'
    embeds_one :quantity, class_name: 'Quantity'
    embeds_one :referenceSeq, class_name: 'MolecularSequenceReferenceSeq'
    embeds_many :variant, class_name: 'MolecularSequenceVariant'
    field :observedSeq, type:  # primitive
    embeds_one :_observedSeq, class_name: 'Extension'
    embeds_many :quality, class_name: 'MolecularSequenceQuality'
    field :readCoverage, type:  # primitive
    embeds_one :_readCoverage, class_name: 'Extension'
    embeds_many :repository, class_name: 'MolecularSequenceRepository'
    embeds_many :pointer, class_name: 'Reference'
    embeds_many :structureVariant, class_name: 'MolecularSequenceStructureVariant'
  end
end
