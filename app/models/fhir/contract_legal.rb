module FHIR
  # fhir/contract_legal.rb
  class ContractLegal < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractLegal'
    embeds_one :contentAttachment, class_name: 'Attachment'
    embeds_one :contentReference, class_name: 'Reference'

    def self.transform_json(json_hash, target=ContractLegal.new)
      result = self.superclass.transform_json(json_hash, target)
      result['contentAttachment'] = Attachment.transform_json(json_hash['contentAttachment']) unless json_hash['contentAttachment'].nil?      
      result['contentReference'] = Reference.transform_json(json_hash['contentReference']) unless json_hash['contentReference'].nil?      

      result
    end
  end
end
