module FHIR
  class MolecularSequenceQualityRoc < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequenceQualityRoc'
    field :score, type: Array # primitive
    embeds_many :_score, class_name: 'Extension'
    field :numTP, type: Array # primitive
    embeds_many :_numTP, class_name: 'Extension'
    field :numFP, type: Array # primitive
    embeds_many :_numFP, class_name: 'Extension'
    field :numFN, type: Array # primitive
    embeds_many :_numFN, class_name: 'Extension'
    field :precision, type: Array # primitive
    embeds_many :_precision, class_name: 'Extension'
    field :sensitivity, type: Array # primitive
    embeds_many :_sensitivity, class_name: 'Extension'
    field :fMeasure, type: Array # primitive
    embeds_many :_fMeasure, class_name: 'Extension'
  end
end
