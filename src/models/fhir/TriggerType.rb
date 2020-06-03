module FHIR
  class TriggerType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TriggerType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
