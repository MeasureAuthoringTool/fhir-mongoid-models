module FHIR
  class QualityType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'QualityType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
