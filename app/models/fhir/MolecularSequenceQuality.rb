module FHIR
  class MolecularSequenceQuality < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequenceQuality'
    embeds_one :type, class_name: 'QualityType'
    embeds_one :standardSequence, class_name: 'CodeableConcept'
    field :start, type:  # primitive
    embeds_one :_start, class_name: 'Extension'
    field :end, type:  # primitive
    embeds_one :_end, class_name: 'Extension'
    embeds_one :score, class_name: 'Quantity'
    embeds_one :method, class_name: 'CodeableConcept'
    field :truthTP, type:  # primitive
    embeds_one :_truthTP, class_name: 'Extension'
    field :queryTP, type:  # primitive
    embeds_one :_queryTP, class_name: 'Extension'
    field :truthFN, type:  # primitive
    embeds_one :_truthFN, class_name: 'Extension'
    field :queryFP, type:  # primitive
    embeds_one :_queryFP, class_name: 'Extension'
    field :gtFP, type:  # primitive
    embeds_one :_gtFP, class_name: 'Extension'
    field :precision, type:  # primitive
    embeds_one :_precision, class_name: 'Extension'
    field :recall, type:  # primitive
    embeds_one :_recall, class_name: 'Extension'
    field :fScore, type:  # primitive
    embeds_one :_fScore, class_name: 'Extension'
    embeds_one :roc, class_name: 'MolecularSequenceQualityRoc'
  end
end
