module FHIR
  class ValueSetCompose < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetCompose'
    field :lockedDate, type:  # primitive
    embeds_one :_lockedDate, class_name: 'Extension'
    field :inactive, type:  # primitive
    embeds_one :_inactive, class_name: 'Extension'
    embeds_many :include, class_name: 'ValueSetComposeInclude'
    embeds_many :exclude, class_name: 'ValueSetComposeInclude'
  end
end
