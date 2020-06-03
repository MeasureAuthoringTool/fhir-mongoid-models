module FHIR
  class RepositoryType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RepositoryType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
