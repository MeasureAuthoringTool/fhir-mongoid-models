module FHIR
  class AdministrativeGender < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AdministrativeGender'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
