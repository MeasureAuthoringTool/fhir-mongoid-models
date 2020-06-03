module FHIR
  class MeasureReport < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureReport'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'MeasureReportStatus'
    embeds_one :type, class_name: 'MeasureReportType'
    field :measure, type:  # primitive
    embeds_one :_measure, class_name: 'Extension'
    embeds_one :subject, class_name: 'Reference'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :reporter, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    embeds_one :improvementNotation, class_name: 'CodeableConcept'
    embeds_many :group, class_name: 'MeasureReportGroup'
    embeds_many :evaluatedResource, class_name: 'Reference'
  end
end
