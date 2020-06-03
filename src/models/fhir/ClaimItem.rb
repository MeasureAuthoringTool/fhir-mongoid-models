module FHIR
  class ClaimItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimItem'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    field :careTeamSequence, type: Array # primitive
    embeds_many :_careTeamSequence, class_name: 'Extension'
    field :diagnosisSequence, type: Array # primitive
    embeds_many :_diagnosisSequence, class_name: 'Extension'
    field :procedureSequence, type: Array # primitive
    embeds_many :_procedureSequence, class_name: 'Extension'
    field :informationSequence, type: Array # primitive
    embeds_many :_informationSequence, class_name: 'Extension'
    embeds_one :revenue, class_name: 'CodeableConcept'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :productOrService, class_name: 'CodeableConcept'
    embeds_many :modifier, class_name: 'CodeableConcept'
    embeds_many :programCode, class_name: 'CodeableConcept'
    field :servicedPrimitiveDate, type:  # primitive
    embeds_one :_servicedPrimitiveDate, class_name: 'Extension'
    embeds_one :servicedPeriod, class_name: 'Period'
    embeds_one :locationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :locationAddress, class_name: 'Address'
    embeds_one :locationReference, class_name: 'Reference'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :unitPrice, class_name: 'Money'
    field :factor, type:  # primitive
    embeds_one :_factor, class_name: 'Extension'
    embeds_one :net, class_name: 'Money'
    embeds_many :udi, class_name: 'Reference'
    embeds_one :bodySite, class_name: 'CodeableConcept'
    embeds_many :subSite, class_name: 'CodeableConcept'
    embeds_many :encounter, class_name: 'Reference'
    embeds_many :detail, class_name: 'ClaimItemDetail'
  end
end
