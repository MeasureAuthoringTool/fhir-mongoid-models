module FHIR
  # fhir/referred_document_status.rb
  class ReferredDocumentStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ReferredDocumentStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ReferredDocumentStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
