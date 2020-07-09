module FHIR
  # fhir/encounter.rb
  class Encounter < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :status, class_name: 'FHIR::EncounterStatus'
    embeds_many :statusHistory, class_name: 'FHIR::EncounterStatusHistory'
    embeds_one :class, class_name: 'FHIR::Coding'
    embeds_many :classHistory, class_name: 'FHIR::EncounterClassHistory'
    embeds_many :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :serviceType, class_name: 'FHIR::CodeableConcept'
    embeds_one :priority, class_name: 'FHIR::CodeableConcept'
    embeds_one :subject, class_name: 'FHIR::Reference'
    embeds_many :episodeOfCare, class_name: 'FHIR::Reference'
    embeds_many :basedOn, class_name: 'FHIR::Reference'
    embeds_many :participant, class_name: 'FHIR::EncounterParticipant'
    embeds_many :appointment, class_name: 'FHIR::Reference'
    embeds_one :period, class_name: 'FHIR::Period'
    embeds_one :length, class_name: 'FHIR::Duration'
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'
    embeds_many :reasonReference, class_name: 'FHIR::Reference'
    embeds_many :diagnosis, class_name: 'FHIR::EncounterDiagnosis'
    embeds_many :account, class_name: 'FHIR::Reference'
    embeds_one :hospitalization, class_name: 'FHIR::EncounterHospitalization'
    embeds_many :location, class_name: 'FHIR::EncounterLocation'
    embeds_one :serviceProvider, class_name: 'FHIR::Reference'
    embeds_one :partOf, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = Encounter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = EncounterStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusHistory'] = json_hash['statusHistory'].map { |var| EncounterStatusHistory.transform_json(var) } unless json_hash['statusHistory'].nil?
      result['class'] = Coding.transform_json(json_hash['class']) unless json_hash['class'].nil?      
      result['classHistory'] = json_hash['classHistory'].map { |var| EncounterClassHistory.transform_json(var) } unless json_hash['classHistory'].nil?
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['serviceType'] = CodeableConcept.transform_json(json_hash['serviceType']) unless json_hash['serviceType'].nil?      
      result['priority'] = CodeableConcept.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['episodeOfCare'] = json_hash['episodeOfCare'].map { |var| Reference.transform_json(var) } unless json_hash['episodeOfCare'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['participant'] = json_hash['participant'].map { |var| EncounterParticipant.transform_json(var) } unless json_hash['participant'].nil?
      result['appointment'] = json_hash['appointment'].map { |var| Reference.transform_json(var) } unless json_hash['appointment'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['length'] = Duration.transform_json(json_hash['length']) unless json_hash['length'].nil?      
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['diagnosis'] = json_hash['diagnosis'].map { |var| EncounterDiagnosis.transform_json(var) } unless json_hash['diagnosis'].nil?
      result['account'] = json_hash['account'].map { |var| Reference.transform_json(var) } unless json_hash['account'].nil?
      result['hospitalization'] = EncounterHospitalization.transform_json(json_hash['hospitalization']) unless json_hash['hospitalization'].nil?      
      result['location'] = json_hash['location'].map { |var| EncounterLocation.transform_json(var) } unless json_hash['location'].nil?
      result['serviceProvider'] = Reference.transform_json(json_hash['serviceProvider']) unless json_hash['serviceProvider'].nil?      
      result['partOf'] = Reference.transform_json(json_hash['partOf']) unless json_hash['partOf'].nil?      

      result
    end
  end
end
