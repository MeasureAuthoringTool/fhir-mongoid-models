module FHIR
  class Substance < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Substance'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'FHIRSubstanceStatus'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :instance, class_name: 'SubstanceInstance'
    embeds_many :ingredient, class_name: 'SubstanceIngredient'
  end
end
