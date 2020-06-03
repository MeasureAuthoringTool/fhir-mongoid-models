module FHIR
  class SubstanceNucleicAcidSubunit < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceNucleicAcidSubunit'
    field :subunit, type:  # primitive
    embeds_one :_subunit, class_name: 'Extension'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    field :length, type:  # primitive
    embeds_one :_length, class_name: 'Extension'
    embeds_one :sequenceAttachment, class_name: 'Attachment'
    embeds_one :fivePrime, class_name: 'CodeableConcept'
    embeds_one :threePrime, class_name: 'CodeableConcept'
    embeds_many :linkage, class_name: 'SubstanceNucleicAcidSubunitLinkage'
    embeds_many :sugar, class_name: 'SubstanceNucleicAcidSubunitSugar'
  end
end
