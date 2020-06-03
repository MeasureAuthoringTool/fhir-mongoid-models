module FHIR
  class SubstanceProteinSubunit < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceProteinSubunit'
    field :subunit, type:  # primitive
    embeds_one :_subunit, class_name: 'Extension'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    field :length, type:  # primitive
    embeds_one :_length, class_name: 'Extension'
    embeds_one :sequenceAttachment, class_name: 'Attachment'
    embeds_one :nTerminalModificationId, class_name: 'Identifier'
    field :nTerminalModification, type:  # primitive
    embeds_one :_nTerminalModification, class_name: 'Extension'
    embeds_one :cTerminalModificationId, class_name: 'Identifier'
    field :cTerminalModification, type:  # primitive
    embeds_one :_cTerminalModification, class_name: 'Extension'
  end
end
