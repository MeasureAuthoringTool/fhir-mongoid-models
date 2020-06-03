module FHIR
  class ValueSetExpansionContains < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetExpansionContains'
    field :system, type:  # primitive
    embeds_one :_system, class_name: 'Extension'
    field :abstract, type:  # primitive
    embeds_one :_abstract, class_name: 'Extension'
    field :inactive, type:  # primitive
    embeds_one :_inactive, class_name: 'Extension'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :display, type:  # primitive
    embeds_one :_display, class_name: 'Extension'
    embeds_many :designation, class_name: 'ValueSetComposeIncludeConceptDesignation'
    embeds_many :contains, class_name: 'ValueSetExpansionContains'
  end
end
