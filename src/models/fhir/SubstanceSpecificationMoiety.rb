module FHIR
  class SubstanceSpecificationMoiety < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationMoiety'
    embeds_one :role, class_name: 'CodeableConcept'
    embeds_one :identifier, class_name: 'Identifier'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :stereochemistry, class_name: 'CodeableConcept'
    embeds_one :opticalActivity, class_name: 'CodeableConcept'
    field :molecularFormula, type:  # primitive
    embeds_one :_molecularFormula, class_name: 'Extension'
    embeds_one :amountQuantity, class_name: 'Quantity'
    field :amountPrimitiveString, type:  # primitive
    embeds_one :_amountPrimitiveString, class_name: 'Extension'
  end
end
