module FHIR
  class DaysOfWeek < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DaysOfWeek'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
