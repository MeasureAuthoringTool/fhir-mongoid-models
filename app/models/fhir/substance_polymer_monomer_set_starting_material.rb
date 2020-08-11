module FHIR
  # fhir/substance_polymer_monomer_set_starting_material.rb
  class SubstancePolymerMonomerSetStartingMaterial < BackboneElement
    include Mongoid::Document
    embeds_one :material, class_name: 'FHIR::CodeableConcept'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :isDefining, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :amount, class_name: 'FHIR::SubstanceAmount'    
    
    def as_json(*args)
      result = super      
      unless self.material.nil? 
        result['material'] = self.material.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.isDefining.nil? 
        result['isDefining'] = self.isDefining.value
        serialized = Extension.serializePrimitiveExtension(self.isDefining)            
        result['_isDefining'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = SubstancePolymerMonomerSetStartingMaterial.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['material'] = CodeableConcept.transform_json(json_hash['material']) unless json_hash['material'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['isDefining'] = PrimitiveBoolean.transform_json(json_hash['isDefining'], json_hash['_isDefining']) unless json_hash['isDefining'].nil?
      result['amount'] = SubstanceAmount.transform_json(json_hash['amount']) unless json_hash['amount'].nil?

      result
    end
  end
end
