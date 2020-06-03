module FHIR
  class CarePlanActivityStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CarePlanActivityStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
