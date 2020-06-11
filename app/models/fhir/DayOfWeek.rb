module FHIR
  class DayOfWeek < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DayOfWeek'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
