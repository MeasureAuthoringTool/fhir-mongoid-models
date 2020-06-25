module FHIR
  # fhir/extension_context_type.rb
  class ExtensionContextType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ExtensionContextType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ExtensionContextType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
