module FHIR
  class ObservationDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ObservationDefinition'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :permittedDataType, class_name: 'ObservationDataType'
    field :multipleResultsAllowed, type:  # primitive
    embeds_one :_multipleResultsAllowed, class_name: 'Extension'
    embeds_one :method, class_name: 'CodeableConcept'
    field :preferredReportName, type:  # primitive
    embeds_one :_preferredReportName, class_name: 'Extension'
    embeds_one :quantitativeDetails, class_name: 'ObservationDefinitionQuantitativeDetails'
    embeds_many :qualifiedInterval, class_name: 'ObservationDefinitionQualifiedInterval'
    embeds_one :validCodedValueSet, class_name: 'Reference'
    embeds_one :normalCodedValueSet, class_name: 'Reference'
    embeds_one :abnormalCodedValueSet, class_name: 'Reference'
    embeds_one :criticalCodedValueSet, class_name: 'Reference'
  end
end
