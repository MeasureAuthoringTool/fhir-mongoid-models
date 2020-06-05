module FHIR
  class Ratio < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Ratio'
    embeds_one :numerator, class_name: 'Quantity'
    embeds_one :denominator, class_name: 'Quantity'
  end
end
