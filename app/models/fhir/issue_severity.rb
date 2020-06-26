module FHIR
  # fhir/issue_severity.rb
  class IssueSeverity < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'IssueSeverity'
    field :value, type: String

    def self.transform_json(json_hash)
      result = IssueSeverity.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
