module FHIR
  # fhir/document_reference_content.rb
  class DocumentReferenceContent < BackboneElement
    include Mongoid::Document
    embeds_one :attachment, class_name: 'FHIR::Attachment'    
    embeds_one :format, class_name: 'FHIR::Coding'    

    def self.transform_json(json_hash, target = DocumentReferenceContent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['attachment'] = Attachment.transform_json(json_hash['attachment']) unless json_hash['attachment'].nil?
      result['format'] = Coding.transform_json(json_hash['format']) unless json_hash['format'].nil?

      result
    end
  end
end
