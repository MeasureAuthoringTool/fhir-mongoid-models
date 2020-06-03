module FHIR
  class BiologicallyDerivedProductCollection < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductCollection'
    embeds_one :collector, class_name: 'Reference'
    embeds_one :source, class_name: 'Reference'
    field :collectedPrimitiveDateTime, type:  # primitive
    embeds_one :_collectedPrimitiveDateTime, class_name: 'Extension'
    embeds_one :collectedPeriod, class_name: 'Period'
  end
end
