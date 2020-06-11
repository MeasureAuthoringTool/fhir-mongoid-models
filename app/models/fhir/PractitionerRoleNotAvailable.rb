module FHIR
  class PractitionerRoleNotAvailable < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PractitionerRoleNotAvailable'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :during, class_name: 'Period'
  end
end
