module FHIR
  # fhir/contract_rule.rb
  class ContractRule < BackboneElement
    include Mongoid::Document
    embeds_one :contentAttachment, class_name: 'FHIR::Attachment'    
    embeds_one :contentReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.contentAttachment.nil?
        result['contentAttachment'] = self.contentAttachment.as_json(*args)                        
      end          
      unless self.contentReference.nil?
        result['contentReference'] = self.contentReference.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ContractRule.new)
      result = self.superclass.transform_json(json_hash, target)
      result['contentAttachment'] = Attachment.transform_json(json_hash['contentAttachment']) unless json_hash['contentAttachment'].nil?
      result['contentReference'] = Reference.transform_json(json_hash['contentReference']) unless json_hash['contentReference'].nil?

      result
    end
  end
end
