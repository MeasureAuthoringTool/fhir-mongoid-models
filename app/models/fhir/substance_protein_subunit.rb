module FHIR
  # fhir/substance_protein_subunit.rb
  class SubstanceProteinSubunit < BackboneElement
    include Mongoid::Document
    embeds_one :subunit, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :sequence, class_name: 'FHIR::PrimitiveString'    
    embeds_one :length, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :sequenceAttachment, class_name: 'FHIR::Attachment'    
    embeds_one :nTerminalModificationId, class_name: 'FHIR::Identifier'    
    embeds_one :nTerminalModification, class_name: 'FHIR::PrimitiveString'    
    embeds_one :cTerminalModificationId, class_name: 'FHIR::Identifier'    
    embeds_one :cTerminalModification, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.subunit.nil? 
        result['subunit'] = self.subunit.value
        serialized = Extension.serializePrimitiveExtension(self.subunit)            
        result['_subunit'] = serialized unless serialized.nil?
      end
      unless self.sequence.nil? 
        result['sequence'] = self.sequence.value
        serialized = Extension.serializePrimitiveExtension(self.sequence)            
        result['_sequence'] = serialized unless serialized.nil?
      end
      unless self.length.nil? 
        result['length'] = self.length.value
        serialized = Extension.serializePrimitiveExtension(self.length)            
        result['_length'] = serialized unless serialized.nil?
      end
      unless self.sequenceAttachment.nil? 
        result['sequenceAttachment'] = self.sequenceAttachment.as_json(*args)
      end
      unless self.nTerminalModificationId.nil? 
        result['nTerminalModificationId'] = self.nTerminalModificationId.as_json(*args)
      end
      unless self.nTerminalModification.nil? 
        result['nTerminalModification'] = self.nTerminalModification.value
        serialized = Extension.serializePrimitiveExtension(self.nTerminalModification)            
        result['_nTerminalModification'] = serialized unless serialized.nil?
      end
      unless self.cTerminalModificationId.nil? 
        result['cTerminalModificationId'] = self.cTerminalModificationId.as_json(*args)
      end
      unless self.cTerminalModification.nil? 
        result['cTerminalModification'] = self.cTerminalModification.value
        serialized = Extension.serializePrimitiveExtension(self.cTerminalModification)            
        result['_cTerminalModification'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceProteinSubunit.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['subunit'] = PrimitiveInteger.transform_json(json_hash['subunit'], json_hash['_subunit']) unless json_hash['subunit'].nil?
      result['sequence'] = PrimitiveString.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?
      result['length'] = PrimitiveInteger.transform_json(json_hash['length'], json_hash['_length']) unless json_hash['length'].nil?
      result['sequenceAttachment'] = Attachment.transform_json(json_hash['sequenceAttachment']) unless json_hash['sequenceAttachment'].nil?
      result['nTerminalModificationId'] = Identifier.transform_json(json_hash['nTerminalModificationId']) unless json_hash['nTerminalModificationId'].nil?
      result['nTerminalModification'] = PrimitiveString.transform_json(json_hash['nTerminalModification'], json_hash['_nTerminalModification']) unless json_hash['nTerminalModification'].nil?
      result['cTerminalModificationId'] = Identifier.transform_json(json_hash['cTerminalModificationId']) unless json_hash['cTerminalModificationId'].nil?
      result['cTerminalModification'] = PrimitiveString.transform_json(json_hash['cTerminalModification'], json_hash['_cTerminalModification']) unless json_hash['cTerminalModification'].nil?

      result
    end
  end
end
