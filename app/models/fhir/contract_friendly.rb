module FHIR
  # fhir/contract_friendly.rb
  class ContractFriendly < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractFriendly'
    embeds_one :contentAttachment, class_name: 'Attachment'
    embeds_one :contentReference, class_name: 'Reference'

    def self.transform_json(json_hash, target=ContractFriendly.new)
      result = self.superclass.transform_json(json_hash, target)
      result['contentAttachment'] = Attachment.transform_json(json_hash['contentAttachment']) unless json_hash['contentAttachment'].nil?      
      result['contentReference'] = Reference.transform_json(json_hash['contentReference']) unless json_hash['contentReference'].nil?      

      result
    end
  end
end
