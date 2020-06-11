module FHIR
  class BiologicallyDerivedProductManipulation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductManipulation'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :timePrimitiveDateTime, type:  # primitive
    embeds_one :_timePrimitiveDateTime, class_name: 'Extension'
    embeds_one :timePeriod, class_name: 'Period'
  end
end
