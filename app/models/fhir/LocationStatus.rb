module FHIR
  class LocationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'LocationStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
