module FHIR
  # fhir/communication_payload.rb
  class CommunicationPayload < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CommunicationPayload'
    embeds_one :contentstring, class_name: 'PrimitiveString'
    embeds_one :contentAttachment, class_name: 'Attachment'
    embeds_one :contentReference, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = CommunicationPayload.new
      result['contentstring'] = PrimitiveString.transform_json(json_hash['contentstring'], json_hash['_contentstring']) unless json_hash['contentstring'].nil?      
      result['contentAttachment'] = Attachment.transform_json(json_hash['contentAttachment']) unless json_hash['contentAttachment'].nil?      
      result['contentReference'] = Reference.transform_json(json_hash['contentReference']) unless json_hash['contentReference'].nil?      

      result
    end
  end
end
