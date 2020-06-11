module FHIR
  class CodeSystemHierarchyMeaning < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystemHierarchyMeaning'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
