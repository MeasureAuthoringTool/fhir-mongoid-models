module FHIR
  class ValueSetComposeInclude < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetComposeInclude'
    field :system, type:  # primitive
    embeds_one :_system, class_name: 'Extension'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    embeds_many :concept, class_name: 'ValueSetComposeIncludeConcept'
    embeds_many :filter, class_name: 'ValueSetComposeIncludeFilter'
    field :valueSet, type: Array # primitive
    embeds_many :_valueSet, class_name: 'Extension'
  end
end
