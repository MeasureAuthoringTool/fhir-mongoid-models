module FHIR
  class SubstanceInstance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceInstance'
    embeds_one :identifier, class_name: 'Identifier'
    field :expiry, type:  # primitive
    embeds_one :_expiry, class_name: 'Extension'
    embeds_one :quantity, class_name: 'SimpleQuantity'
  end
end
