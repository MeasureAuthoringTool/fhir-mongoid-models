module FHIR
  # fhir/molecular_sequence_reference_seq.rb
  class MolecularSequenceReferenceSeq < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequenceReferenceSeq'
    embeds_one :chromosome, class_name: 'CodeableConcept'
    embeds_one :genomeBuild, class_name: 'PrimitiveString'
    embeds_one :orientation, class_name: 'OrientationType'
    embeds_one :referenceSeqId, class_name: 'CodeableConcept'
    embeds_one :referenceSeqPointer, class_name: 'Reference'
    embeds_one :referenceSeqString, class_name: 'PrimitiveString'
    embeds_one :strand, class_name: 'StrandType'
    embeds_one :windowStart, class_name: 'PrimitiveInteger'
    embeds_one :windowEnd, class_name: 'PrimitiveInteger'

    def self.transform_json(json_hash)
      result = MolecularSequenceReferenceSeq.new
      result['chromosome'] = CodeableConcept.transform_json(json_hash['chromosome']) unless json_hash['chromosome'].nil?      
      result['genomeBuild'] = PrimitiveString.transform_json(json_hash['genomeBuild'], json_hash['_genomeBuild']) unless json_hash['genomeBuild'].nil?      
      result['orientation'] = OrientationType.transform_json(json_hash['orientation']) unless json_hash['orientation'].nil?      
      result['referenceSeqId'] = CodeableConcept.transform_json(json_hash['referenceSeqId']) unless json_hash['referenceSeqId'].nil?      
      result['referenceSeqPointer'] = Reference.transform_json(json_hash['referenceSeqPointer']) unless json_hash['referenceSeqPointer'].nil?      
      result['referenceSeqString'] = PrimitiveString.transform_json(json_hash['referenceSeqString'], json_hash['_referenceSeqString']) unless json_hash['referenceSeqString'].nil?      
      result['strand'] = StrandType.transform_json(json_hash['strand']) unless json_hash['strand'].nil?      
      result['windowStart'] = PrimitiveInteger.transform_json(json_hash['windowStart'], json_hash['_windowStart']) unless json_hash['windowStart'].nil?      
      result['windowEnd'] = PrimitiveInteger.transform_json(json_hash['windowEnd'], json_hash['_windowEnd']) unless json_hash['windowEnd'].nil?      

      result
    end
  end
end
