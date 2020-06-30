module FHIR
  # fhir/mime_type.rb
  class MimeType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MimeType'
    field :value, type: String

    def self.transform_json(json_hash, target=MimeType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
