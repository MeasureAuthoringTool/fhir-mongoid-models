module FHIR
  class DeviceDefinitionSpecialization < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceDefinitionSpecialization'
    field :systemType, type:  # primitive
    embeds_one :_systemType, class_name: 'Extension'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
  end
end
