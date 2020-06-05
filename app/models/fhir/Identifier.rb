module FHIR
  class Identifier < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Identifier'
    embeds_one :use, class_name: 'IdentifierUse'
    embeds_one :type, class_name: 'CodeableConcept'
    field :system, type:  # primitive
    embeds_one :_system, class_name: 'Extension'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
    embeds_one :period, class_name: 'Period'
    embeds_one :assigner, class_name: 'Reference'
  end
end
