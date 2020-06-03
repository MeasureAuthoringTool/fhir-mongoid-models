module FHIR
  class CompartmentType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CompartmentType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
