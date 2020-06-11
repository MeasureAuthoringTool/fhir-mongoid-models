module FHIR
  class GroupMeasure < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GroupMeasure'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
