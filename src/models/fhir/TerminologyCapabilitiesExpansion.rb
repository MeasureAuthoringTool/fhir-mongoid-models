module FHIR
  class TerminologyCapabilitiesExpansion < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesExpansion'
    field :hierarchical, type:  # primitive
    embeds_one :_hierarchical, class_name: 'Extension'
    field :paging, type:  # primitive
    embeds_one :_paging, class_name: 'Extension'
    field :incomplete, type:  # primitive
    embeds_one :_incomplete, class_name: 'Extension'
    embeds_many :parameter, class_name: 'TerminologyCapabilitiesExpansionParameter'
    field :textFilter, type:  # primitive
    embeds_one :_textFilter, class_name: 'Extension'
  end
end
