module FHIR
  # fhir/contract_rule.rb
  class ContractRule < BackboneElement
    include Mongoid::Document
    embeds_one :contentAttachment, class_name: 'FHIR::Attachment'    
    embeds_one :contentReference, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = ContractRule.new)
      result = self.superclass.transform_json(json_hash, target)
      result['contentAttachment'] = Attachment.transform_json(json_hash['contentAttachment']) unless json_hash['contentAttachment'].nil?
      result['contentReference'] = Reference.transform_json(json_hash['contentReference']) unless json_hash['contentReference'].nil?

      result
    end
  end
end
