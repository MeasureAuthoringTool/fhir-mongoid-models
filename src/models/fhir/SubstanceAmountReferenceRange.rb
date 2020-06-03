module FHIR
  class SubstanceAmountReferenceRange < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceAmountReferenceRange'
    embeds_one :lowLimit, class_name: 'Quantity'
    embeds_one :highLimit, class_name: 'Quantity'
  end
end
