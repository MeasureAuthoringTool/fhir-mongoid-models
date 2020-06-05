module FHIR
  class SubstanceSpecificationStructureIsotopeMolecularWeight < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationStructureIsotopeMolecularWeight'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'Quantity'
  end
end
