module FHIR
  class RiskEvidenceSynthesis < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'RiskEvidenceSynthesis'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    embeds_many :identifier, class_name: 'Identifier'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    embeds_one :status, class_name: 'PublicationStatus'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    field :publisher, type:  # primitive
    embeds_one :_publisher, class_name: 'Extension'
    embeds_many :contact, class_name: 'ContactDetail'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
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
    embeds_one :synthesisType, class_name: 'CodeableConcept'
    embeds_one :studyType, class_name: 'CodeableConcept'
    embeds_one :population, class_name: 'Reference'
    embeds_one :exposure, class_name: 'Reference'
    embeds_one :outcome, class_name: 'Reference'
    embeds_one :sampleSize, class_name: 'RiskEvidenceSynthesisSampleSize'
    embeds_one :riskEstimate, class_name: 'RiskEvidenceSynthesisRiskEstimate'
    embeds_many :certainty, class_name: 'RiskEvidenceSynthesisCertainty'
  end
end
