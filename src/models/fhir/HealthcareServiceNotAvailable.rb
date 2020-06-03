module FHIR
  class HealthcareServiceNotAvailable < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'HealthcareServiceNotAvailable'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :during, class_name: 'Period'
  end
end
