module FHIR
  # fhir/molecular_sequence_structure_variant.rb
  class MolecularSequenceStructureVariant < BackboneElement
    include Mongoid::Document
    embeds_one :variantType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :exact, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :length, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :outer, class_name: 'FHIR::MolecularSequenceStructureVariantOuter'    
    embeds_one :inner, class_name: 'FHIR::MolecularSequenceStructureVariantInner'    
    
    def as_json(*args)
      result = super      
      unless self.variantType.nil? 
        result['variantType'] = self.variantType.as_json(*args)
      end
      unless self.exact.nil? 
        result['exact'] = self.exact.value
        serialized = Extension.serializePrimitiveExtension(self.exact)            
        result['_exact'] = serialized unless serialized.nil?
      end
      unless self.length.nil? 
        result['length'] = self.length.value
        serialized = Extension.serializePrimitiveExtension(self.length)            
        result['_length'] = serialized unless serialized.nil?
      end
      unless self.outer.nil? 
        result['outer'] = self.outer.as_json(*args)
      end
      unless self.inner.nil? 
        result['inner'] = self.inner.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MolecularSequenceStructureVariant.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['variantType'] = CodeableConcept.transform_json(json_hash['variantType']) unless json_hash['variantType'].nil?
      result['exact'] = PrimitiveBoolean.transform_json(json_hash['exact'], json_hash['_exact']) unless json_hash['exact'].nil?
      result['length'] = PrimitiveInteger.transform_json(json_hash['length'], json_hash['_length']) unless json_hash['length'].nil?
      result['outer'] = MolecularSequenceStructureVariantOuter.transform_json(json_hash['outer']) unless json_hash['outer'].nil?
      result['inner'] = MolecularSequenceStructureVariantInner.transform_json(json_hash['inner']) unless json_hash['inner'].nil?

      result
    end
  end
end
