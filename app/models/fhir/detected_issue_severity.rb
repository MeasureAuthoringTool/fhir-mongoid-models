module FHIR
  # fhir/detected_issue_severity.rb
  class DetectedIssueSeverity < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DetectedIssueSeverity'
    field :value, type: String

    def self.transform_json(json_hash, target=DetectedIssueSeverity.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
