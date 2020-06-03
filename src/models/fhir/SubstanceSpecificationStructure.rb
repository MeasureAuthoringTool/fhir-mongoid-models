module FHIR
  class SubstanceSpecificationStructure < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationStructure'
    embeds_one :stereochemistry, class_name: 'CodeableConcept'
    embeds_one :opticalActivity, class_name: 'CodeableConcept'
    field :molecularFormula, type:  # primitive
    embeds_one :_molecularFormula, class_name: 'Extension'
    field :molecularFormulaByMoiety, type:  # primitive
    embeds_one :_molecularFormulaByMoiety, class_name: 'Extension'
    embeds_many :isotope, class_name: 'SubstanceSpecificationStructureIsotope'
    embeds_one :molecularWeight, class_name: 'SubstanceSpecificationStructureIsotopeMolecularWeight'
    embeds_many :source, class_name: 'Reference'
    embeds_many :representation, class_name: 'SubstanceSpecificationStructureRepresentation'
  end
end
