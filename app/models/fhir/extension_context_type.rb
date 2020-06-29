module FHIR
  # fhir/extension_context_type.rb
  class ExtensionContextType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ExtensionContextType'
    field :value, type: String

    def self.transform_json(json_hash, target=ExtensionContextType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
