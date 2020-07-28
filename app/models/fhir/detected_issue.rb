module FHIR
  # fhir/detected_issue.rb
  class DetectedIssue < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::DetectedIssueStatus'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :severity, class_name: 'FHIR::DetectedIssueSeverity'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :identifiedDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :identifiedPeriod, class_name: 'FHIR::Period'    
    embeds_one :author, class_name: 'FHIR::Reference'    
    embeds_many :implicated, class_name: 'FHIR::Reference'    
    embeds_many :evidence, class_name: 'FHIR::DetectedIssueEvidence'    
    embeds_one :detail, class_name: 'FHIR::PrimitiveString'    
    embeds_one :reference, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :mitigation, class_name: 'FHIR::DetectedIssueMitigation'    

    def self.transform_json(json_hash, target = DetectedIssue.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = DetectedIssueStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['severity'] = DetectedIssueSeverity.transform_json(json_hash['severity']) unless json_hash['severity'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['identifiedDateTime'] = PrimitiveDateTime.transform_json(json_hash['identifiedDateTime'], json_hash['_identifiedDateTime']) unless json_hash['identifiedDateTime'].nil?
      result['identifiedPeriod'] = Period.transform_json(json_hash['identifiedPeriod']) unless json_hash['identifiedPeriod'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?
      result['implicated'] = json_hash['implicated'].map { |var| Reference.transform_json(var) } unless json_hash['implicated'].nil?
      result['evidence'] = json_hash['evidence'].map { |var| DetectedIssueEvidence.transform_json(var) } unless json_hash['evidence'].nil?
      result['detail'] = PrimitiveString.transform_json(json_hash['detail'], json_hash['_detail']) unless json_hash['detail'].nil?
      result['reference'] = PrimitiveUri.transform_json(json_hash['reference'], json_hash['_reference']) unless json_hash['reference'].nil?
      result['mitigation'] = json_hash['mitigation'].map { |var| DetectedIssueMitigation.transform_json(var) } unless json_hash['mitigation'].nil?

      result
    end
  end
end
