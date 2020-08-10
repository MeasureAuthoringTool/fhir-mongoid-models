module FHIR
  # fhir/substance_polymer_repeat.rb
  class SubstancePolymerRepeat < BackboneElement
    include Mongoid::Document
    embeds_one :numberOfUnits, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :averageMolecularFormula, class_name: 'FHIR::PrimitiveString'    
    embeds_one :repeatUnitAmountType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :repeatUnit, class_name: 'FHIR::SubstancePolymerRepeatRepeatUnit'    
    
    def as_json(*args)
      result = super      
      unless self.numberOfUnits.nil? 
        result['numberOfUnits'] = self.numberOfUnits.value
        serialized = Extension.serializePrimitiveExtension(self.numberOfUnits)            
        result['_numberOfUnits'] = serialized unless serialized.nil?
      end
      unless self.averageMolecularFormula.nil? 
        result['averageMolecularFormula'] = self.averageMolecularFormula.value
        serialized = Extension.serializePrimitiveExtension(self.averageMolecularFormula)            
        result['_averageMolecularFormula'] = serialized unless serialized.nil?
      end
      unless self.repeatUnitAmountType.nil? 
        result['repeatUnitAmountType'] = self.repeatUnitAmountType.as_json(*args)
      end
      unless self.repeatUnit.nil?  || !self.repeatUnit.any? 
        result['repeatUnit'] = self.repeatUnit.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstancePolymerRepeat.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['numberOfUnits'] = PrimitiveInteger.transform_json(json_hash['numberOfUnits'], json_hash['_numberOfUnits']) unless json_hash['numberOfUnits'].nil?
      result['averageMolecularFormula'] = PrimitiveString.transform_json(json_hash['averageMolecularFormula'], json_hash['_averageMolecularFormula']) unless json_hash['averageMolecularFormula'].nil?
      result['repeatUnitAmountType'] = CodeableConcept.transform_json(json_hash['repeatUnitAmountType']) unless json_hash['repeatUnitAmountType'].nil?
      result['repeatUnit'] = json_hash['repeatUnit'].map { |var| SubstancePolymerRepeatRepeatUnit.transform_json(var) } unless json_hash['repeatUnit'].nil?

      result
    end
  end
end
