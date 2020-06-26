module FHIR
  # fhir/contract_rule.rb
  class ContractRule < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractRule'
    embeds_one :contentAttachment, class_name: 'Attachment'
    embeds_one :contentReference, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = ContractRule.new
      result['contentAttachment'] = Attachment.transform_json(json_hash['contentAttachment']) unless json_hash['contentAttachment'].nil?      
      result['contentReference'] = Reference.transform_json(json_hash['contentReference']) unless json_hash['contentReference'].nil?      

      result
    end
  end
end
