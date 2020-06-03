module FHIR
  class ProductShelfLife < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ProductShelfLife'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Quantity'
    embeds_many :specialPrecautionsForStorage, class_name: 'CodeableConcept'
  end
end
