module FHIR
  # fhir/risk_assessment.rb
  class RiskAssessment < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :basedOn, class_name: 'FHIR::Reference'
    embeds_one :parent, class_name: 'FHIR::Reference'
    embeds_one :status, class_name: 'FHIR::RiskAssessmentStatus'
    embeds_one :method, class_name: 'FHIR::CodeableConcept'
    embeds_one :code, class_name: 'FHIR::CodeableConcept'
    embeds_one :subject, class_name: 'FHIR::Reference'
    embeds_one :encounter, class_name: 'FHIR::Reference'
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :occurrencePeriod, class_name: 'FHIR::Period'
    embeds_one :condition, class_name: 'FHIR::Reference'
    embeds_one :performer, class_name: 'FHIR::Reference'
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'
    embeds_many :reasonReference, class_name: 'FHIR::Reference'
    embeds_many :basis, class_name: 'FHIR::Reference'
    embeds_many :prediction, class_name: 'FHIR::RiskAssessmentPrediction'
    embeds_one :mitigation, class_name: 'FHIR::PrimitiveString'
    embeds_many :note, class_name: 'FHIR::Annotation'

    def self.transform_json(json_hash, target = RiskAssessment.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = Reference.transform_json(json_hash['basedOn']) unless json_hash['basedOn'].nil?      
      result['parent'] = Reference.transform_json(json_hash['parent']) unless json_hash['parent'].nil?      
      result['status'] = RiskAssessmentStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?      
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?      
      result['condition'] = Reference.transform_json(json_hash['condition']) unless json_hash['condition'].nil?      
      result['performer'] = Reference.transform_json(json_hash['performer']) unless json_hash['performer'].nil?      
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['basis'] = json_hash['basis'].map { |var| Reference.transform_json(var) } unless json_hash['basis'].nil?
      result['prediction'] = json_hash['prediction'].map { |var| RiskAssessmentPrediction.transform_json(var) } unless json_hash['prediction'].nil?
      result['mitigation'] = PrimitiveString.transform_json(json_hash['mitigation'], json_hash['_mitigation']) unless json_hash['mitigation'].nil?      
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
