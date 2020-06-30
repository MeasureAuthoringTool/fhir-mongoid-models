module FHIR
  # fhir/document_confidentiality.rb
  class DocumentConfidentiality < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentConfidentiality'
    field :value, type: String

    def self.transform_json(json_hash, target=DocumentConfidentiality.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
