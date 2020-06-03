module FHIR
  class Range < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Range'
    embeds_one :low, class_name: 'SimpleQuantity'
    embeds_one :high, class_name: 'SimpleQuantity'
  end
end
