module FHIR
  # fhir/substance_specification_structure_isotope.rb
  class SubstanceSpecificationStructureIsotope < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :name, class_name: 'CodeableConcept'
    embeds_one :substitution, class_name: 'CodeableConcept'
    embeds_one :halfLife, class_name: 'Quantity'
    embeds_one :molecularWeight, class_name: 'SubstanceSpecificationStructureIsotopeMolecularWeight'

    def self.transform_json(json_hash, target = SubstanceSpecificationStructureIsotope.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['name'] = CodeableConcept.transform_json(json_hash['name']) unless json_hash['name'].nil?      
      result['substitution'] = CodeableConcept.transform_json(json_hash['substitution']) unless json_hash['substitution'].nil?      
      result['halfLife'] = Quantity.transform_json(json_hash['halfLife']) unless json_hash['halfLife'].nil?      
      result['molecularWeight'] = SubstanceSpecificationStructureIsotopeMolecularWeight.transform_json(json_hash['molecularWeight']) unless json_hash['molecularWeight'].nil?      

      result
    end
  end
end
