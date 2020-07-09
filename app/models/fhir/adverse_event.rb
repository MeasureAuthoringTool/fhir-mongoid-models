module FHIR
  # fhir/adverse_event.rb
  class AdverseEvent < DomainResource
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'
    embeds_one :actuality, class_name: 'FHIR::AdverseEventActuality'
    embeds_many :category, class_name: 'FHIR::CodeableConcept'
    embeds_one :event, class_name: 'FHIR::CodeableConcept'
    embeds_one :subject, class_name: 'FHIR::Reference'
    embeds_one :encounter, class_name: 'FHIR::Reference'
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :detected, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :recordedDate, class_name: 'FHIR::PrimitiveDateTime'
    embeds_many :resultingCondition, class_name: 'FHIR::Reference'
    embeds_one :location, class_name: 'FHIR::Reference'
    embeds_one :seriousness, class_name: 'FHIR::CodeableConcept'
    embeds_one :severity, class_name: 'FHIR::CodeableConcept'
    embeds_one :outcome, class_name: 'FHIR::CodeableConcept'
    embeds_one :recorder, class_name: 'FHIR::Reference'
    embeds_many :contributor, class_name: 'FHIR::Reference'
    embeds_many :suspectEntity, class_name: 'FHIR::AdverseEventSuspectEntity'
    embeds_many :subjectMedicalHistory, class_name: 'FHIR::Reference'
    embeds_many :referenceDocument, class_name: 'FHIR::Reference'
    embeds_many :study, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = AdverseEvent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['actuality'] = AdverseEventActuality.transform_json(json_hash['actuality']) unless json_hash['actuality'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['event'] = CodeableConcept.transform_json(json_hash['event']) unless json_hash['event'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['detected'] = PrimitiveDateTime.transform_json(json_hash['detected'], json_hash['_detected']) unless json_hash['detected'].nil?      
      result['recordedDate'] = PrimitiveDateTime.transform_json(json_hash['recordedDate'], json_hash['_recordedDate']) unless json_hash['recordedDate'].nil?      
      result['resultingCondition'] = json_hash['resultingCondition'].map { |var| Reference.transform_json(var) } unless json_hash['resultingCondition'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?      
      result['seriousness'] = CodeableConcept.transform_json(json_hash['seriousness']) unless json_hash['seriousness'].nil?      
      result['severity'] = CodeableConcept.transform_json(json_hash['severity']) unless json_hash['severity'].nil?      
      result['outcome'] = CodeableConcept.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?      
      result['recorder'] = Reference.transform_json(json_hash['recorder']) unless json_hash['recorder'].nil?      
      result['contributor'] = json_hash['contributor'].map { |var| Reference.transform_json(var) } unless json_hash['contributor'].nil?
      result['suspectEntity'] = json_hash['suspectEntity'].map { |var| AdverseEventSuspectEntity.transform_json(var) } unless json_hash['suspectEntity'].nil?
      result['subjectMedicalHistory'] = json_hash['subjectMedicalHistory'].map { |var| Reference.transform_json(var) } unless json_hash['subjectMedicalHistory'].nil?
      result['referenceDocument'] = json_hash['referenceDocument'].map { |var| Reference.transform_json(var) } unless json_hash['referenceDocument'].nil?
      result['study'] = json_hash['study'].map { |var| Reference.transform_json(var) } unless json_hash['study'].nil?

      result
    end
  end
end
