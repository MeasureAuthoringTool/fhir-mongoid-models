module FHIR
  class MarketingStatus < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MarketingStatus'
    embeds_one :country, class_name: 'CodeableConcept'
    embeds_one :jurisdiction, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'CodeableConcept'
    embeds_one :dateRange, class_name: 'Period'
    field :restoreDate, type:  # primitive
    embeds_one :_restoreDate, class_name: 'Extension'
  end
end
