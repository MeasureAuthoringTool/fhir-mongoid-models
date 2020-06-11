module FHIR
  class ConceptMapGroup < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConceptMapGroup'
    field :source, type:  # primitive
    embeds_one :_source, class_name: 'Extension'
    field :sourceVersion, type:  # primitive
    embeds_one :_sourceVersion, class_name: 'Extension'
    field :target, type:  # primitive
    embeds_one :_target, class_name: 'Extension'
    field :targetVersion, type:  # primitive
    embeds_one :_targetVersion, class_name: 'Extension'
    embeds_many :element, class_name: 'ConceptMapGroupElement'
    embeds_one :unmapped, class_name: 'ConceptMapGroupUnmapped'
  end
end
