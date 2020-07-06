module FHIR
  # fhir/communication_request_payload.rb
  class CommunicationRequestPayload < BackboneElement
    include Mongoid::Document
    embeds_one :contentString, class_name: 'PrimitiveString'
    embeds_one :contentAttachment, class_name: 'Attachment'
    embeds_one :contentReference, class_name: 'Reference'

    def self.transform_json(json_hash, target = CommunicationRequestPayload.new)
      result = self.superclass.transform_json(json_hash, target)
      result['contentString'] = PrimitiveString.transform_json(json_hash['contentString'], json_hash['_contentString']) unless json_hash['contentString'].nil?      
      result['contentAttachment'] = Attachment.transform_json(json_hash['contentAttachment']) unless json_hash['contentAttachment'].nil?      
      result['contentReference'] = Reference.transform_json(json_hash['contentReference']) unless json_hash['contentReference'].nil?      

      result
    end
  end
end
