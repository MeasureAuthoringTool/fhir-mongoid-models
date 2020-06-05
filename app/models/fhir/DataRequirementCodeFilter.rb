module FHIR
  class DataRequirementCodeFilter < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DataRequirementCodeFilter'
    field :path, type:  # primitive
    embeds_one :_path, class_name: 'Extension'
    field :searchParam, type:  # primitive
    embeds_one :_searchParam, class_name: 'Extension'
    field :valueSet, type:  # primitive
    embeds_one :_valueSet, class_name: 'Extension'
    embeds_many :code, class_name: 'Coding'
  end
end
