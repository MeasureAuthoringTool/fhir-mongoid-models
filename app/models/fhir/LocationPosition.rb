module FHIR
  class LocationPosition < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'LocationPosition'
    field :longitude, type:  # primitive
    embeds_one :_longitude, class_name: 'Extension'
    field :latitude, type:  # primitive
    embeds_one :_latitude, class_name: 'Extension'
    field :altitude, type:  # primitive
    embeds_one :_altitude, class_name: 'Extension'
  end
end
