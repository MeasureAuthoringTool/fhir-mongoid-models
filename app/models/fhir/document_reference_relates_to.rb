module FHIR
  # fhir/document_reference_relates_to.rb
  class DocumentReferenceRelatesTo < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentReferenceRelatesTo'
    embeds_one :code, class_name: 'DocumentRelationshipType'
    embeds_one :target, class_name: 'Reference'

    def self.transform_json(json_hash, target=DocumentReferenceRelatesTo.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = DocumentRelationshipType.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['target'] = Reference.transform_json(json_hash['target']) unless json_hash['target'].nil?      

      result
    end
  end
end
