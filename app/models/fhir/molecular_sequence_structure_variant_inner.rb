module FHIR
  # fhir/molecular_sequence_structure_variant_inner.rb
  class MolecularSequenceStructureVariantInner < BackboneElement
    include Mongoid::Document
    embeds_one :start, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :end, class_name: 'FHIR::PrimitiveInteger'    
    
    def as_json(*args)
      result = super      
      unless self.start.nil? 
        result['start'] = self.start.value
        serialized = Extension.serializePrimitiveExtension(self.start)            
        result['_start'] = serialized unless serialized.nil?
      end
      unless self.end.nil? 
        result['end'] = self.end.value
        serialized = Extension.serializePrimitiveExtension(self.end)            
        result['_end'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MolecularSequenceStructureVariantInner.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['start'] = PrimitiveInteger.transform_json(json_hash['start'], json_hash['_start']) unless json_hash['start'].nil?
      result['end'] = PrimitiveInteger.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?

      result
    end
  end
end
