module FHIR
  class CarePlanIntent < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CarePlanIntent'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
