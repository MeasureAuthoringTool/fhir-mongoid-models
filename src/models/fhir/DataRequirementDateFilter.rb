module FHIR
  class DataRequirementDateFilter < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DataRequirementDateFilter'
    field :path, type:  # primitive
    embeds_one :_path, class_name: 'Extension'
    field :searchParam, type:  # primitive
    embeds_one :_searchParam, class_name: 'Extension'
    field :valuePrimitiveDateTime, type:  # primitive
    embeds_one :_valuePrimitiveDateTime, class_name: 'Extension'
    embeds_one :valuePeriod, class_name: 'Period'
    embeds_one :valueDuration, class_name: 'Duration'
  end
end
