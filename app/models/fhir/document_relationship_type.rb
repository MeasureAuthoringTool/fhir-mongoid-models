module FHIR
  # fhir/document_relationship_type.rb
  class DocumentRelationshipType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentRelationshipType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = DocumentRelationshipType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
