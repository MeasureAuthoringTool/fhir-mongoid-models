module FHIR
  class SampledData < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SampledData'
    embeds_one :origin, class_name: 'SimpleQuantity'
    field :period, type:  # primitive
    embeds_one :_period, class_name: 'Extension'
    field :factor, type:  # primitive
    embeds_one :_factor, class_name: 'Extension'
    field :lowerLimit, type:  # primitive
    embeds_one :_lowerLimit, class_name: 'Extension'
    field :upperLimit, type:  # primitive
    embeds_one :_upperLimit, class_name: 'Extension'
    field :dimensions, type:  # primitive
    embeds_one :_dimensions, class_name: 'Extension'
    field :data, type:  # primitive
    embeds_one :_data, class_name: 'Extension'
  end
end
