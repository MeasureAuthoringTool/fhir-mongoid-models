module FHIR
  class LocationMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'LocationMode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
