module FHIR
  # fhir/substance_specification_moiety.rb
  class SubstanceSpecificationMoiety < BackboneElement
    include Mongoid::Document
    embeds_one :role, class_name: 'FHIR::CodeableConcept'    
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :stereochemistry, class_name: 'FHIR::CodeableConcept'    
    embeds_one :opticalActivity, class_name: 'FHIR::CodeableConcept'    
    embeds_one :molecularFormula, class_name: 'FHIR::PrimitiveString'    
    embeds_one :amountQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :amountString, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.role.nil? 
        result['role'] = self.role.as_json(*args)
      end
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
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
      unless self.amountQuantity.nil?
        result['amountQuantity'] = self.amountQuantity.as_json(*args)                        
      end          
      unless self.amountString.nil?
        result['amountString'] = self.amountString.value                        
        serialized = Extension.serializePrimitiveExtension(self.amountString) 
        result['_amountString'] = serialized unless serialized.nil?
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSpecificationMoiety.new)
      result = self.superclass.transform_json(json_hash, target)
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['stereochemistry'] = CodeableConcept.transform_json(json_hash['stereochemistry']) unless json_hash['stereochemistry'].nil?
      result['opticalActivity'] = CodeableConcept.transform_json(json_hash['opticalActivity']) unless json_hash['opticalActivity'].nil?
      result['molecularFormula'] = PrimitiveString.transform_json(json_hash['molecularFormula'], json_hash['_molecularFormula']) unless json_hash['molecularFormula'].nil?
      result['amountQuantity'] = Quantity.transform_json(json_hash['amountQuantity']) unless json_hash['amountQuantity'].nil?
      result['amountString'] = PrimitiveString.transform_json(json_hash['amountString'], json_hash['_amountString']) unless json_hash['amountString'].nil?

      result
    end
  end
end
