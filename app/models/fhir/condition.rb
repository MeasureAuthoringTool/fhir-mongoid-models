module FHIR
  # fhir/condition.rb
  class Condition < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :clinicalStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_one :verificationStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :severity, class_name: 'FHIR::CodeableConcept'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :bodySite, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :onsetDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :onsetAge, class_name: 'FHIR::Age'    
    embeds_one :onsetPeriod, class_name: 'FHIR::Period'    
    embeds_one :onsetRange, class_name: 'FHIR::Range'    
    embeds_one :onsetString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :abatementDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :abatementAge, class_name: 'FHIR::Age'    
    embeds_one :abatementPeriod, class_name: 'FHIR::Period'    
    embeds_one :abatementRange, class_name: 'FHIR::Range'    
    embeds_one :abatementString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :recordedDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :recorder, class_name: 'FHIR::Reference'    
    embeds_one :asserter, class_name: 'FHIR::Reference'    
    embeds_many :stage, class_name: 'FHIR::ConditionStage'    
    embeds_many :evidence, class_name: 'FHIR::ConditionEvidence'    
    embeds_many :note, class_name: 'FHIR::Annotation'    

    def self.transform_json(json_hash, target = Condition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['clinicalStatus'] = CodeableConcept.transform_json(json_hash['clinicalStatus']) unless json_hash['clinicalStatus'].nil?
      result['verificationStatus'] = CodeableConcept.transform_json(json_hash['verificationStatus']) unless json_hash['verificationStatus'].nil?
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['severity'] = CodeableConcept.transform_json(json_hash['severity']) unless json_hash['severity'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['bodySite'] = json_hash['bodySite'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['bodySite'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['onsetDateTime'] = PrimitiveDateTime.transform_json(json_hash['onsetDateTime'], json_hash['_onsetDateTime']) unless json_hash['onsetDateTime'].nil?
      result['onsetAge'] = Age.transform_json(json_hash['onsetAge']) unless json_hash['onsetAge'].nil?
      result['onsetPeriod'] = Period.transform_json(json_hash['onsetPeriod']) unless json_hash['onsetPeriod'].nil?
      result['onsetRange'] = Range.transform_json(json_hash['onsetRange']) unless json_hash['onsetRange'].nil?
      result['onsetString'] = PrimitiveString.transform_json(json_hash['onsetString'], json_hash['_onsetString']) unless json_hash['onsetString'].nil?
      result['abatementDateTime'] = PrimitiveDateTime.transform_json(json_hash['abatementDateTime'], json_hash['_abatementDateTime']) unless json_hash['abatementDateTime'].nil?
      result['abatementAge'] = Age.transform_json(json_hash['abatementAge']) unless json_hash['abatementAge'].nil?
      result['abatementPeriod'] = Period.transform_json(json_hash['abatementPeriod']) unless json_hash['abatementPeriod'].nil?
      result['abatementRange'] = Range.transform_json(json_hash['abatementRange']) unless json_hash['abatementRange'].nil?
      result['abatementString'] = PrimitiveString.transform_json(json_hash['abatementString'], json_hash['_abatementString']) unless json_hash['abatementString'].nil?
      result['recordedDate'] = PrimitiveDateTime.transform_json(json_hash['recordedDate'], json_hash['_recordedDate']) unless json_hash['recordedDate'].nil?
      result['recorder'] = Reference.transform_json(json_hash['recorder']) unless json_hash['recorder'].nil?
      result['asserter'] = Reference.transform_json(json_hash['asserter']) unless json_hash['asserter'].nil?
      result['stage'] = json_hash['stage'].map { |var| ConditionStage.transform_json(var) } unless json_hash['stage'].nil?
      result['evidence'] = json_hash['evidence'].map { |var| ConditionEvidence.transform_json(var) } unless json_hash['evidence'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
