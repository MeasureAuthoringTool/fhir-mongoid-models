module FHIR
  # fhir/molecular_sequence_variant.rb
  class MolecularSequenceVariant < BackboneElement
    include Mongoid::Document
    embeds_one :start, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :end, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :observedAllele, class_name: 'FHIR::PrimitiveString'    
    embeds_one :referenceAllele, class_name: 'FHIR::PrimitiveString'    
    embeds_one :cigar, class_name: 'FHIR::PrimitiveString'    
    embeds_one :variantPointer, class_name: 'FHIR::Reference'    
    
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
      unless self.observedAllele.nil? 
        result['observedAllele'] = self.observedAllele.value
        serialized = Extension.serializePrimitiveExtension(self.observedAllele)            
        result['_observedAllele'] = serialized unless serialized.nil?
      end
      unless self.referenceAllele.nil? 
        result['referenceAllele'] = self.referenceAllele.value
        serialized = Extension.serializePrimitiveExtension(self.referenceAllele)            
        result['_referenceAllele'] = serialized unless serialized.nil?
      end
      unless self.cigar.nil? 
        result['cigar'] = self.cigar.value
        serialized = Extension.serializePrimitiveExtension(self.cigar)            
        result['_cigar'] = serialized unless serialized.nil?
      end
      unless self.variantPointer.nil? 
        result['variantPointer'] = self.variantPointer.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MolecularSequenceVariant.new)
      result = self.superclass.transform_json(json_hash, target)
      result['start'] = PrimitiveInteger.transform_json(json_hash['start'], json_hash['_start']) unless json_hash['start'].nil?
      result['end'] = PrimitiveInteger.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?
      result['observedAllele'] = PrimitiveString.transform_json(json_hash['observedAllele'], json_hash['_observedAllele']) unless json_hash['observedAllele'].nil?
      result['referenceAllele'] = PrimitiveString.transform_json(json_hash['referenceAllele'], json_hash['_referenceAllele']) unless json_hash['referenceAllele'].nil?
      result['cigar'] = PrimitiveString.transform_json(json_hash['cigar'], json_hash['_cigar']) unless json_hash['cigar'].nil?
      result['variantPointer'] = Reference.transform_json(json_hash['variantPointer']) unless json_hash['variantPointer'].nil?

      result
    end
  end
end
