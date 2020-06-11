module FHIR
  class DeviceSpecialization < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceSpecialization'
    embeds_one :systemType, class_name: 'CodeableConcept'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
  end
end
