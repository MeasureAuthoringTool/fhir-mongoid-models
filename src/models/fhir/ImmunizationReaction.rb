module FHIR
  class ImmunizationReaction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationReaction'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :detail, class_name: 'Reference'
    field :reported, type:  # primitive
    embeds_one :_reported, class_name: 'Extension'
  end
end
