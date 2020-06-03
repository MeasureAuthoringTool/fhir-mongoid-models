module FHIR
  class DataRequirementSort < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DataRequirementSort'
    field :path, type:  # primitive
    embeds_one :_path, class_name: 'Extension'
    embeds_one :direction, class_name: 'SortDirection'
  end
end
