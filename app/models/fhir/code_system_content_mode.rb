module FHIR
  # fhir/code_system_content_mode.rb
  class CodeSystemContentMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystemContentMode'
    field :value, type: String

    def self.transform_json(json_hash, target=CodeSystemContentMode.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
