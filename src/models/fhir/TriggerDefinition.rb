module FHIR
  class TriggerDefinition < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TriggerDefinition'
    embeds_one :type, class_name: 'TriggerType'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :timingTiming, class_name: 'Timing'
    embeds_one :timingReference, class_name: 'Reference'
    field :timingPrimitiveDate, type:  # primitive
    embeds_one :_timingPrimitiveDate, class_name: 'Extension'
    field :timingPrimitiveDateTime, type:  # primitive
    embeds_one :_timingPrimitiveDateTime, class_name: 'Extension'
    embeds_many :data, class_name: 'DataRequirement'
    embeds_one :condition, class_name: 'Expression'
  end
end
