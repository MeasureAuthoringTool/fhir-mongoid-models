module FHIR
  # fhir/issue_type.rb
  class IssueType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'IssueType'
    field :value, type: String

    def self.transform_json(json_hash, target=IssueType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
