module FHIR
  class CarePlanStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CarePlanStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
