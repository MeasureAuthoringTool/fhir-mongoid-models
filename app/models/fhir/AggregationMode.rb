module FHIR
  class AggregationMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AggregationMode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
