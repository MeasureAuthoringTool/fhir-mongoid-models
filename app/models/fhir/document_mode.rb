module FHIR
  # fhir/document_mode.rb
  class DocumentMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentMode'
    field :value, type: String

    def self.transform_json(json_hash)
      result = DocumentMode.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
