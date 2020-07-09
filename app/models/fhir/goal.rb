module FHIR
  # fhir/goal.rb
  class Goal < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :lifecycleStatus, class_name: 'FHIR::GoalLifecycleStatus'
    embeds_one :achievementStatus, class_name: 'FHIR::CodeableConcept'
    embeds_many :category, class_name: 'FHIR::CodeableConcept'
    embeds_one :priority, class_name: 'FHIR::CodeableConcept'
    embeds_one :description, class_name: 'FHIR::CodeableConcept'
    embeds_one :subject, class_name: 'FHIR::Reference'
    embeds_one :startDate, class_name: 'FHIR::PrimitiveDate'
    embeds_one :startCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_many :target, class_name: 'FHIR::GoalTarget'
    embeds_one :statusDate, class_name: 'FHIR::PrimitiveDate'
    embeds_one :statusReason, class_name: 'FHIR::PrimitiveString'
    embeds_one :expressedBy, class_name: 'FHIR::Reference'
    embeds_many :addresses, class_name: 'FHIR::Reference'
    embeds_many :note, class_name: 'FHIR::Annotation'
    embeds_many :outcomeCode, class_name: 'FHIR::CodeableConcept'
    embeds_many :outcomeReference, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = Goal.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['lifecycleStatus'] = GoalLifecycleStatus.transform_json(json_hash['lifecycleStatus']) unless json_hash['lifecycleStatus'].nil?      
      result['achievementStatus'] = CodeableConcept.transform_json(json_hash['achievementStatus']) unless json_hash['achievementStatus'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['priority'] = CodeableConcept.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['description'] = CodeableConcept.transform_json(json_hash['description']) unless json_hash['description'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['startDate'] = PrimitiveDate.transform_json(json_hash['startDate'], json_hash['_startDate']) unless json_hash['startDate'].nil?      
      result['startCodeableConcept'] = CodeableConcept.transform_json(json_hash['startCodeableConcept']) unless json_hash['startCodeableConcept'].nil?      
      result['target'] = json_hash['target'].map { |var| GoalTarget.transform_json(var) } unless json_hash['target'].nil?
      result['statusDate'] = PrimitiveDate.transform_json(json_hash['statusDate'], json_hash['_statusDate']) unless json_hash['statusDate'].nil?      
      result['statusReason'] = PrimitiveString.transform_json(json_hash['statusReason'], json_hash['_statusReason']) unless json_hash['statusReason'].nil?      
      result['expressedBy'] = Reference.transform_json(json_hash['expressedBy']) unless json_hash['expressedBy'].nil?      
      result['addresses'] = json_hash['addresses'].map { |var| Reference.transform_json(var) } unless json_hash['addresses'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['outcomeCode'] = json_hash['outcomeCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['outcomeCode'].nil?
      result['outcomeReference'] = json_hash['outcomeReference'].map { |var| Reference.transform_json(var) } unless json_hash['outcomeReference'].nil?

      result
    end
  end
end
