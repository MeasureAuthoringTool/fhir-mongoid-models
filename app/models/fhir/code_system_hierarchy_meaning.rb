module FHIR
  # fhir/code_system_hierarchy_meaning.rb
  class CodeSystemHierarchyMeaning < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystemHierarchyMeaning'
    field :value, type: String

    def self.transform_json(json_hash)
      result = CodeSystemHierarchyMeaning.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
