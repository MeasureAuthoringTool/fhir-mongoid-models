module FHIR
  class IssueType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'IssueType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
