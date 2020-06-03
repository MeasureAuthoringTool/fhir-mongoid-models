module FHIR
  class PractitionerRoleAvailableTime < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PractitionerRoleAvailableTime'
    embeds_many :daysOfWeek, class_name: 'DaysOfWeek'
    field :allDay, type:  # primitive
    embeds_one :_allDay, class_name: 'Extension'
    field :availableStartTime, type:  # primitive
    embeds_one :_availableStartTime, class_name: 'Extension'
    field :availableEndTime, type:  # primitive
    embeds_one :_availableEndTime, class_name: 'Extension'
  end
end
