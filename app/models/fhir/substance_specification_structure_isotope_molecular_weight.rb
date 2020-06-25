module FHIR
  # fhir/substance_specification_structure_isotope_molecular_weight.rb
  class SubstanceSpecificationStructureIsotopeMolecularWeight < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationStructureIsotopeMolecularWeight'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'Quantity'

    def self.transform_json(json_hash)
      result = SubstanceSpecificationStructureIsotopeMolecularWeight.new
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['amount'] = Quantity.transform_json(json_hash['amount']) unless json_hash['amount'].nil?      

      result
    end
  end
end
