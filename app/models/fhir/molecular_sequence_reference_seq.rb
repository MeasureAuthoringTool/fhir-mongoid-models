module FHIR
  # fhir/molecular_sequence_reference_seq.rb
  class MolecularSequenceReferenceSeq < BackboneElement
    include Mongoid::Document
    embeds_one :chromosome, class_name: 'FHIR::CodeableConcept'    
    embeds_one :genomeBuild, class_name: 'FHIR::PrimitiveString'    
    embeds_one :orientation, class_name: 'FHIR::OrientationType'    
    embeds_one :referenceSeqId, class_name: 'FHIR::CodeableConcept'    
    embeds_one :referenceSeqPointer, class_name: 'FHIR::Reference'    
    embeds_one :referenceSeqString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :strand, class_name: 'FHIR::StrandType'    
    embeds_one :windowStart, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :windowEnd, class_name: 'FHIR::PrimitiveInteger'    
    
    def as_json(*args)
      result = super      
      unless self.chromosome.nil? 
        result['chromosome'] = self.chromosome.as_json(*args)
      end
      unless self.genomeBuild.nil? 
        result['genomeBuild'] = self.genomeBuild.value
        serialized = Extension.serializePrimitiveExtension(self.genomeBuild)            
        result['_genomeBuild'] = serialized unless serialized.nil?
      end
      unless self.orientation.nil? 
        result['orientation'] = self.orientation.value
        serialized = Extension.serializePrimitiveExtension(self.orientation)            
        result['_orientation'] = serialized unless serialized.nil?
      end
      unless self.referenceSeqId.nil? 
        result['referenceSeqId'] = self.referenceSeqId.as_json(*args)
      end
      unless self.referenceSeqPointer.nil? 
        result['referenceSeqPointer'] = self.referenceSeqPointer.as_json(*args)
      end
      unless self.referenceSeqString.nil? 
        result['referenceSeqString'] = self.referenceSeqString.value
        serialized = Extension.serializePrimitiveExtension(self.referenceSeqString)            
        result['_referenceSeqString'] = serialized unless serialized.nil?
      end
      unless self.strand.nil? 
        result['strand'] = self.strand.value
        serialized = Extension.serializePrimitiveExtension(self.strand)            
        result['_strand'] = serialized unless serialized.nil?
      end
      unless self.windowStart.nil? 
        result['windowStart'] = self.windowStart.value
        serialized = Extension.serializePrimitiveExtension(self.windowStart)            
        result['_windowStart'] = serialized unless serialized.nil?
      end
      unless self.windowEnd.nil? 
        result['windowEnd'] = self.windowEnd.value
        serialized = Extension.serializePrimitiveExtension(self.windowEnd)            
        result['_windowEnd'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MolecularSequenceReferenceSeq.new)
      result = self.superclass.transform_json(json_hash, target)
      result['chromosome'] = CodeableConcept.transform_json(json_hash['chromosome']) unless json_hash['chromosome'].nil?
      result['genomeBuild'] = PrimitiveString.transform_json(json_hash['genomeBuild'], json_hash['_genomeBuild']) unless json_hash['genomeBuild'].nil?
      result['orientation'] = OrientationType.transform_json(json_hash['orientation'], json_hash['_orientation']) unless json_hash['orientation'].nil?
      result['referenceSeqId'] = CodeableConcept.transform_json(json_hash['referenceSeqId']) unless json_hash['referenceSeqId'].nil?
      result['referenceSeqPointer'] = Reference.transform_json(json_hash['referenceSeqPointer']) unless json_hash['referenceSeqPointer'].nil?
      result['referenceSeqString'] = PrimitiveString.transform_json(json_hash['referenceSeqString'], json_hash['_referenceSeqString']) unless json_hash['referenceSeqString'].nil?
      result['strand'] = StrandType.transform_json(json_hash['strand'], json_hash['_strand']) unless json_hash['strand'].nil?
      result['windowStart'] = PrimitiveInteger.transform_json(json_hash['windowStart'], json_hash['_windowStart']) unless json_hash['windowStart'].nil?
      result['windowEnd'] = PrimitiveInteger.transform_json(json_hash['windowEnd'], json_hash['_windowEnd']) unless json_hash['windowEnd'].nil?

      result
    end
  end
end
