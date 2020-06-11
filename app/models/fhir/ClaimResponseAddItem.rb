module FHIR
  class ClaimResponseAddItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponseAddItem'
    field :itemSequence, type: Array # primitive
    embeds_many :_itemSequence, class_name: 'Extension'
    field :detailSequence, type: Array # primitive
    embeds_many :_detailSequence, class_name: 'Extension'
    field :subdetailSequence, type: Array # primitive
    embeds_many :_subdetailSequence, class_name: 'Extension'
    embeds_many :provider, class_name: 'Reference'
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
    embeds_one :bodySite, class_name: 'CodeableConcept'
    embeds_many :subSite, class_name: 'CodeableConcept'
    field :noteNumber, type: Array # primitive
    embeds_many :_noteNumber, class_name: 'Extension'
    embeds_many :adjudication, class_name: 'ClaimResponseItemAdjudication'
    embeds_many :detail, class_name: 'ClaimResponseAddItemDetail'
  end
end
