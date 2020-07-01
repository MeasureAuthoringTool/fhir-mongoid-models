module FHIR
  # fhir/substance_specification_structure.rb
  class SubstanceSpecificationStructure < BackboneElement
    include Mongoid::Document
    embeds_one :stereochemistry, class_name: 'CodeableConcept'
    embeds_one :opticalActivity, class_name: 'CodeableConcept'
    embeds_one :molecularFormula, class_name: 'PrimitiveString'
    embeds_one :molecularFormulaByMoiety, class_name: 'PrimitiveString'
    embeds_many :isotope, class_name: 'SubstanceSpecificationStructureIsotope'
    embeds_one :molecularWeight, class_name: 'SubstanceSpecificationStructureIsotopeMolecularWeight'
    embeds_many :source, class_name: 'Reference'
    embeds_many :representation, class_name: 'SubstanceSpecificationStructureRepresentation'

    def self.transform_json(json_hash, target = SubstanceSpecificationStructure.new)
      result = self.superclass.transform_json(json_hash, target)
      result['stereochemistry'] = CodeableConcept.transform_json(json_hash['stereochemistry']) unless json_hash['stereochemistry'].nil?      
      result['opticalActivity'] = CodeableConcept.transform_json(json_hash['opticalActivity']) unless json_hash['opticalActivity'].nil?      
      result['molecularFormula'] = PrimitiveString.transform_json(json_hash['molecularFormula'], json_hash['_molecularFormula']) unless json_hash['molecularFormula'].nil?      
      result['molecularFormulaByMoiety'] = PrimitiveString.transform_json(json_hash['molecularFormulaByMoiety'], json_hash['_molecularFormulaByMoiety']) unless json_hash['molecularFormulaByMoiety'].nil?      
      result['isotope'] = json_hash['isotope'].map { |var| SubstanceSpecificationStructureIsotope.transform_json(var) } unless json_hash['isotope'].nil?
      result['molecularWeight'] = SubstanceSpecificationStructureIsotopeMolecularWeight.transform_json(json_hash['molecularWeight']) unless json_hash['molecularWeight'].nil?      
      result['source'] = json_hash['source'].map { |var| Reference.transform_json(var) } unless json_hash['source'].nil?
      result['representation'] = json_hash['representation'].map { |var| SubstanceSpecificationStructureRepresentation.transform_json(var) } unless json_hash['representation'].nil?

      result
    end
  end
end
