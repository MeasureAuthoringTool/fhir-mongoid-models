module FHIR
  class Encounter < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Encounter'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'EncounterStatus'
    embeds_many :statusHistory, class_name: 'EncounterStatusHistory'
    embeds_one :class, class_name: 'Coding'
    embeds_many :classHistory, class_name: 'EncounterClassHistory'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_one :serviceType, class_name: 'CodeableConcept'
    embeds_one :priority, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_many :episodeOfCare, class_name: 'Reference'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :participant, class_name: 'EncounterParticipant'
    embeds_many :appointment, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    embeds_one :length, class_name: 'Duration'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :diagnosis, class_name: 'EncounterDiagnosis'
    embeds_many :account, class_name: 'Reference'
    embeds_one :hospitalization, class_name: 'EncounterHospitalization'
    embeds_many :location, class_name: 'EncounterLocation'
    embeds_one :serviceProvider, class_name: 'Reference'
    embeds_one :partOf, class_name: 'Reference'
  end
end
