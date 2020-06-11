module FHIR
  class ObservationDataType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ObservationDataType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
