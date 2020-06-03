module FHIR
  class ActivityDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ActivityDefinition'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    embeds_many :identifier, class_name: 'Identifier'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    field :subtitle, type:  # primitive
    embeds_one :_subtitle, class_name: 'Extension'
    embeds_one :status, class_name: 'PublicationStatus'
    field :experimental, type:  # primitive
    embeds_one :_experimental, class_name: 'Extension'
    embeds_one :subjectCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :subjectReference, class_name: 'Reference'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    field :publisher, type:  # primitive
    embeds_one :_publisher, class_name: 'Extension'
    embeds_many :contact, class_name: 'ContactDetail'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    field :purpose, type:  # primitive
    embeds_one :_purpose, class_name: 'Extension'
    field :usage, type:  # primitive
    embeds_one :_usage, class_name: 'Extension'
    field :copyright, type:  # primitive
    embeds_one :_copyright, class_name: 'Extension'
    field :approvalDate, type:  # primitive
    embeds_one :_approvalDate, class_name: 'Extension'
    field :lastReviewDate, type:  # primitive
    embeds_one :_lastReviewDate, class_name: 'Extension'
    embeds_one :effectivePeriod, class_name: 'Period'
    embeds_many :topic, class_name: 'CodeableConcept'
    embeds_many :author, class_name: 'ContactDetail'
    embeds_many :editor, class_name: 'ContactDetail'
    embeds_many :reviewer, class_name: 'ContactDetail'
    embeds_many :endorser, class_name: 'ContactDetail'
    embeds_many :relatedArtifact, class_name: 'RelatedArtifact'
    field :library, type: Array # primitive
    embeds_many :_library, class_name: 'Extension'
    embeds_one :kind, class_name: 'ActivityDefinitionKind'
    field :profile, type:  # primitive
    embeds_one :_profile, class_name: 'Extension'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :intent, class_name: 'RequestIntent'
    embeds_one :priority, class_name: 'RequestPriority'
    field :doNotPerform, type:  # primitive
    embeds_one :_doNotPerform, class_name: 'Extension'
    embeds_one :timingTiming, class_name: 'Timing'
    field :timingPrimitiveDateTime, type:  # primitive
    embeds_one :_timingPrimitiveDateTime, class_name: 'Extension'
    embeds_one :timingAge, class_name: 'Age'
    embeds_one :timingPeriod, class_name: 'Period'
    embeds_one :timingRange, class_name: 'Range'
    embeds_one :timingDuration, class_name: 'Duration'
    embeds_one :location, class_name: 'Reference'
    embeds_many :participant, class_name: 'ActivityDefinitionParticipant'
    embeds_one :productReference, class_name: 'Reference'
    embeds_one :productCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_many :dosage, class_name: 'Dosage'
    embeds_many :bodySite, class_name: 'CodeableConcept'
    embeds_many :specimenRequirement, class_name: 'Reference'
    embeds_many :observationRequirement, class_name: 'Reference'
    embeds_many :observationResultRequirement, class_name: 'Reference'
    field :transform, type:  # primitive
    embeds_one :_transform, class_name: 'Extension'
    embeds_many :dynamicValue, class_name: 'ActivityDefinitionDynamicValue'
  end
end
