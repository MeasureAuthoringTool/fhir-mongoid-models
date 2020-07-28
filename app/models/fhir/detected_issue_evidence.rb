module FHIR
  # fhir/detected_issue_evidence.rb
  class DetectedIssueEvidence < BackboneElement
    include Mongoid::Document
    embeds_many :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :detail, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = DetectedIssueEvidence.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['detail'] = json_hash['detail'].map { |var| Reference.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
