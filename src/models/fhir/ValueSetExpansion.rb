module FHIR
  class ValueSetExpansion < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetExpansion'
    field :identifier, type:  # primitive
    embeds_one :_identifier, class_name: 'Extension'
    field :timestamp, type:  # primitive
    embeds_one :_timestamp, class_name: 'Extension'
    field :total, type:  # primitive
    embeds_one :_total, class_name: 'Extension'
    field :offset, type:  # primitive
    embeds_one :_offset, class_name: 'Extension'
    embeds_many :parameter, class_name: 'ValueSetExpansionParameter'
    embeds_many :contains, class_name: 'ValueSetExpansionContains'
  end
end
