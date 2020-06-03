module FHIR
  class EventTiming < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EventTiming'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
