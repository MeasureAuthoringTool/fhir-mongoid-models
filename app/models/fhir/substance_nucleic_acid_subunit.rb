module FHIR
  # fhir/substance_nucleic_acid_subunit.rb
  class SubstanceNucleicAcidSubunit < BackboneElement
    include Mongoid::Document
    embeds_one :subunit, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :sequence, class_name: 'FHIR::PrimitiveString'    
    embeds_one :length, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :sequenceAttachment, class_name: 'FHIR::Attachment'    
    embeds_one :fivePrime, class_name: 'FHIR::CodeableConcept'    
    embeds_one :threePrime, class_name: 'FHIR::CodeableConcept'    
    embeds_many :linkage, class_name: 'FHIR::SubstanceNucleicAcidSubunitLinkage'    
    embeds_many :sugar, class_name: 'FHIR::SubstanceNucleicAcidSubunitSugar'    
    
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
      unless self.fivePrime.nil? 
        result['fivePrime'] = self.fivePrime.as_json(*args)
      end
      unless self.threePrime.nil? 
        result['threePrime'] = self.threePrime.as_json(*args)
      end
      unless self.linkage.nil?  || !self.linkage.any? 
        result['linkage'] = self.linkage.map{ |x| x.as_json(*args) }
      end
      unless self.sugar.nil?  || !self.sugar.any? 
        result['sugar'] = self.sugar.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceNucleicAcidSubunit.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['subunit'] = PrimitiveInteger.transform_json(json_hash['subunit'], json_hash['_subunit']) unless json_hash['subunit'].nil?
      result['sequence'] = PrimitiveString.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?
      result['length'] = PrimitiveInteger.transform_json(json_hash['length'], json_hash['_length']) unless json_hash['length'].nil?
      result['sequenceAttachment'] = Attachment.transform_json(json_hash['sequenceAttachment']) unless json_hash['sequenceAttachment'].nil?
      result['fivePrime'] = CodeableConcept.transform_json(json_hash['fivePrime']) unless json_hash['fivePrime'].nil?
      result['threePrime'] = CodeableConcept.transform_json(json_hash['threePrime']) unless json_hash['threePrime'].nil?
      result['linkage'] = json_hash['linkage'].map { |var| SubstanceNucleicAcidSubunitLinkage.transform_json(var) } unless json_hash['linkage'].nil?
      result['sugar'] = json_hash['sugar'].map { |var| SubstanceNucleicAcidSubunitSugar.transform_json(var) } unless json_hash['sugar'].nil?

      result
    end
  end
end
