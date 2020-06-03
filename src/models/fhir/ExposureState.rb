module FHIR
  class ExposureState < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ExposureState'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
