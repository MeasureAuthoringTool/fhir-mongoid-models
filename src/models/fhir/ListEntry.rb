module FHIR
  class ListEntry < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ListEntry'
    embeds_one :flag, class_name: 'CodeableConcept'
    field :deleted, type:  # primitive
    embeds_one :_deleted, class_name: 'Extension'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :item, class_name: 'Reference'
  end
end
