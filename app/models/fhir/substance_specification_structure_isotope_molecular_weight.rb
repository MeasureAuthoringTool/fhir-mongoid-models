module FHIR
  # fhir/substance_specification_structure_isotope_molecular_weight.rb
  class SubstanceSpecificationStructureIsotopeMolecularWeight < BackboneElement
    include Mongoid::Document
    embeds_one :method, class_name: 'FHIR::CodeableConcept'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amount, class_name: 'FHIR::Quantity'    
    
    def as_json(*args)
      result = super      
      unless self.method.nil? 
        result['method'] = self.method.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.amount.nil? 
        result['amount'] = self.amount.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSpecificationStructureIsotopeMolecularWeight.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['amount'] = Quantity.transform_json(json_hash['amount']) unless json_hash['amount'].nil?

      result
    end
  end
end
