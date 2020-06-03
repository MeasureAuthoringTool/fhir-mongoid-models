module FHIR
  class ResearchStudy < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ResearchStudy'
    embeds_many :identifier, class_name: 'Identifier'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    embeds_many :protocol, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'ResearchStudyStatus'
    embeds_one :primaryPurposeType, class_name: 'CodeableConcept'
    embeds_one :phase, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_many :focus, class_name: 'CodeableConcept'
    embeds_many :condition, class_name: 'CodeableConcept'
    embeds_many :contact, class_name: 'ContactDetail'
    embeds_many :relatedArtifact, class_name: 'RelatedArtifact'
    embeds_many :keyword, class_name: 'CodeableConcept'
    embeds_many :location, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :enrollment, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    embeds_one :sponsor, class_name: 'Reference'
    embeds_one :principalInvestigator, class_name: 'Reference'
    embeds_many :site, class_name: 'Reference'
    embeds_one :reasonStopped, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :arm, class_name: 'ResearchStudyArm'
    embeds_many :objective, class_name: 'ResearchStudyObjective'
  end
end
