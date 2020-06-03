module FHIR
  class SubstanceSpecificationStructureIsotope < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationStructureIsotope'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :name, class_name: 'CodeableConcept'
    embeds_one :substitution, class_name: 'CodeableConcept'
    embeds_one :halfLife, class_name: 'Quantity'
    embeds_one :molecularWeight, class_name: 'SubstanceSpecificationStructureIsotopeMolecularWeight'
  end
end
