module FHIR
  class CarePlanActivityKind < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CarePlanActivityKind'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
