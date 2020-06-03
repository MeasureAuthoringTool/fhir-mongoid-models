module FHIR
  class LocationHoursOfOperation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'LocationHoursOfOperation'
    embeds_many :daysOfWeek, class_name: 'DaysOfWeek'
    field :allDay, type:  # primitive
    embeds_one :_allDay, class_name: 'Extension'
    field :openingTime, type:  # primitive
    embeds_one :_openingTime, class_name: 'Extension'
    field :closingTime, type:  # primitive
    embeds_one :_closingTime, class_name: 'Extension'
  end
end
