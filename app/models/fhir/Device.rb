module FHIR
  class Device < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Device'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :definition, class_name: 'Reference'
    embeds_many :udiCarrier, class_name: 'DeviceUdiCarrier'
    embeds_one :status, class_name: 'FHIRDeviceStatus'
    embeds_many :statusReason, class_name: 'CodeableConcept'
    field :distinctIdentifier, type:  # primitive
    embeds_one :_distinctIdentifier, class_name: 'Extension'
    field :manufacturer, type:  # primitive
    embeds_one :_manufacturer, class_name: 'Extension'
    field :manufactureDate, type:  # primitive
    embeds_one :_manufactureDate, class_name: 'Extension'
    field :expirationDate, type:  # primitive
    embeds_one :_expirationDate, class_name: 'Extension'
    field :lotNumber, type:  # primitive
    embeds_one :_lotNumber, class_name: 'Extension'
    field :serialNumber, type:  # primitive
    embeds_one :_serialNumber, class_name: 'Extension'
    embeds_many :deviceName, class_name: 'DeviceDeviceName'
    field :modelNumber, type:  # primitive
    embeds_one :_modelNumber, class_name: 'Extension'
    field :partNumber, type:  # primitive
    embeds_one :_partNumber, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :specialization, class_name: 'DeviceSpecialization'
    embeds_many :version, class_name: 'DeviceVersion'
    embeds_many :property, class_name: 'DeviceProperty'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :owner, class_name: 'Reference'
    embeds_many :contact, class_name: 'ContactPoint'
    embeds_one :location, class_name: 'Reference'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :safety, class_name: 'CodeableConcept'
    embeds_one :parent, class_name: 'Reference'
  end
end
