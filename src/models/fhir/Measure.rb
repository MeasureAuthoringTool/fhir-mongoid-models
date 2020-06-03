module FHIR
  class Measure < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Measure'
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
    field :disclaimer, type:  # primitive
    embeds_one :_disclaimer, class_name: 'Extension'
    embeds_one :scoring, class_name: 'CodeableConcept'
    embeds_one :compositeScoring, class_name: 'CodeableConcept'
    embeds_many :type, class_name: 'CodeableConcept'
    field :riskAdjustment, type:  # primitive
    embeds_one :_riskAdjustment, class_name: 'Extension'
    field :rateAggregation, type:  # primitive
    embeds_one :_rateAggregation, class_name: 'Extension'
    field :rationale, type:  # primitive
    embeds_one :_rationale, class_name: 'Extension'
    field :clinicalRecommendationStatement, type:  # primitive
    embeds_one :_clinicalRecommendationStatement, class_name: 'Extension'
    embeds_one :improvementNotation, class_name: 'CodeableConcept'
    field :definition, type: Array # primitive
    embeds_many :_definition, class_name: 'Extension'
    field :guidance, type:  # primitive
    embeds_one :_guidance, class_name: 'Extension'
    embeds_many :group, class_name: 'MeasureGroup'
    embeds_many :supplementalData, class_name: 'MeasureSupplementalData'
  end
end
