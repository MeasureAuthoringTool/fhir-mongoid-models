module FHIR
  # fhir/detected_issue_evidence.rb
  class DetectedIssueEvidence < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DetectedIssueEvidence'
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_many :detail, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = DetectedIssueEvidence.new
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['detail'] = json_hash['detail'].map { |var| Reference.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
