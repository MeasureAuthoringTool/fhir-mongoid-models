module FHIR
  class SubstanceSpecificationCode < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationCode'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'CodeableConcept'
    field :statusDate, type:  # primitive
    embeds_one :_statusDate, class_name: 'Extension'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
    embeds_many :source, class_name: 'Reference'
  end
end
