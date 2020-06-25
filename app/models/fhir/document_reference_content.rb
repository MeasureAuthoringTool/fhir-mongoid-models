module FHIR
  # fhir/document_reference_content.rb
  class DocumentReferenceContent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentReferenceContent'
    embeds_one :attachment, class_name: 'Attachment'
    embeds_one :format, class_name: 'Coding'

    def self.transform_json(json_hash)
      result = DocumentReferenceContent.new
      result['attachment'] = Attachment.transform_json(json_hash['attachment']) unless json_hash['attachment'].nil?      
      result['format'] = Coding.transform_json(json_hash['format']) unless json_hash['format'].nil?      

      result
    end
  end
end
