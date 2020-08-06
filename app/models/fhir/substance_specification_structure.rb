module FHIR
  # fhir/substance_specification_structure.rb
  class SubstanceSpecificationStructure < BackboneElement
    include Mongoid::Document
    embeds_one :stereochemistry, class_name: 'FHIR::CodeableConcept'    
    embeds_one :opticalActivity, class_name: 'FHIR::CodeableConcept'    
    embeds_one :molecularFormula, class_name: 'FHIR::PrimitiveString'    
    embeds_one :molecularFormulaByMoiety, class_name: 'FHIR::PrimitiveString'    
    embeds_many :isotope, class_name: 'FHIR::SubstanceSpecificationStructureIsotope'    
    embeds_one :molecularWeight, class_name: 'FHIR::SubstanceSpecificationStructureIsotopeMolecularWeight'    
    embeds_many :source, class_name: 'FHIR::Reference'    
    embeds_many :representation, class_name: 'FHIR::SubstanceSpecificationStructureRepresentation'    
    
    def as_json(*args)
      result = super      
      unless self.stereochemistry.nil? 
        result['stereochemistry'] = self.stereochemistry.as_json(*args)
      end
      unless self.opticalActivity.nil? 
        result['opticalActivity'] = self.opticalActivity.as_json(*args)
      end
      unless self.molecularFormula.nil? 
        result['molecularFormula'] = self.molecularFormula.value
        serialized = Extension.serializePrimitiveExtension(self.molecularFormula)            
        result['_molecularFormula'] = serialized unless serialized.nil?
      end
      unless self.molecularFormulaByMoiety.nil? 
        result['molecularFormulaByMoiety'] = self.molecularFormulaByMoiety.value
        serialized = Extension.serializePrimitiveExtension(self.molecularFormulaByMoiety)            
        result['_molecularFormulaByMoiety'] = serialized unless serialized.nil?
      end
      unless self.isotope.nil?  || !self.isotope.any? 
        result['isotope'] = self.isotope.map{ |x| x.as_json(*args) }
      end
      unless self.molecularWeight.nil? 
        result['molecularWeight'] = self.molecularWeight.as_json(*args)
      end
      unless self.source.nil?  || !self.source.any? 
        result['source'] = self.source.map{ |x| x.as_json(*args) }
      end
      unless self.representation.nil?  || !self.representation.any? 
        result['representation'] = self.representation.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSpecificationStructure.new)
      result = self.superclass.transform_json(json_hash, target)
      result['stereochemistry'] = CodeableConcept.transform_json(json_hash['stereochemistry']) unless json_hash['stereochemistry'].nil?
      result['opticalActivity'] = CodeableConcept.transform_json(json_hash['opticalActivity']) unless json_hash['opticalActivity'].nil?
      result['molecularFormula'] = PrimitiveString.transform_json(json_hash['molecularFormula'], json_hash['_molecularFormula']) unless json_hash['molecularFormula'].nil?
      result['molecularFormulaByMoiety'] = PrimitiveString.transform_json(json_hash['molecularFormulaByMoiety'], json_hash['_molecularFormulaByMoiety']) unless json_hash['molecularFormulaByMoiety'].nil?
      result['isotope'] = json_hash['isotope'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSpecificationStructureIsotope.transform_json(var) 
        end
      } unless json_hash['isotope'].nil?
      result['molecularWeight'] = SubstanceSpecificationStructureIsotopeMolecularWeight.transform_json(json_hash['molecularWeight']) unless json_hash['molecularWeight'].nil?
      result['source'] = json_hash['source'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['source'].nil?
      result['representation'] = json_hash['representation'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSpecificationStructureRepresentation.transform_json(var) 
        end
      } unless json_hash['representation'].nil?

      result
    end
  end
end
