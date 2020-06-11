module FHIR
  class ClaimItemDetail < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimItemDetail'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    embeds_one :revenue, class_name: 'CodeableConcept'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :productOrService, class_name: 'CodeableConcept'
    embeds_many :modifier, class_name: 'CodeableConcept'
    embeds_many :programCode, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :unitPrice, class_name: 'Money'
    field :factor, type:  # primitive
    embeds_one :_factor, class_name: 'Extension'
    embeds_one :net, class_name: 'Money'
    embeds_many :udi, class_name: 'Reference'
    embeds_many :subDetail, class_name: 'ClaimItemDetailSubDetail'
  end
end
