module FHIR
  # fhir/detected_issue_status.rb
  class DetectedIssueStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DetectedIssueStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = DetectedIssueStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
