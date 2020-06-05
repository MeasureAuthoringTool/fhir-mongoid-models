module FHIR
  class DeviceDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceDefinition'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :udiDeviceIdentifier, class_name: 'DeviceDefinitionUdiDeviceIdentifier'
    field :manufacturerPrimitiveString, type:  # primitive
    embeds_one :_manufacturerPrimitiveString, class_name: 'Extension'
    embeds_one :manufacturerReference, class_name: 'Reference'
    embeds_many :deviceName, class_name: 'DeviceDefinitionDeviceName'
    field :modelNumber, type:  # primitive
    embeds_one :_modelNumber, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :specialization, class_name: 'DeviceDefinitionSpecialization'
    field :version, type: Array # primitive
    embeds_many :_version, class_name: 'Extension'
    embeds_many :safety, class_name: 'CodeableConcept'
    embeds_many :shelfLifeStorage, class_name: 'ProductShelfLife'
    embeds_one :physicalCharacteristics, class_name: 'ProdCharacteristic'
    embeds_many :languageCode, class_name: 'CodeableConcept'
    embeds_many :capability, class_name: 'DeviceDefinitionCapability'
    embeds_many :property, class_name: 'DeviceDefinitionProperty'
    embeds_one :owner, class_name: 'Reference'
    embeds_many :contact, class_name: 'ContactPoint'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    field :onlineInformation, type:  # primitive
    embeds_one :_onlineInformation, class_name: 'Extension'
    embeds_many :note, class_name: 'Annotation'
    embeds_one :quantity, class_name: 'Quantity'
    embeds_one :parentDevice, class_name: 'Reference'
    embeds_many :material, class_name: 'DeviceDefinitionMaterial'
  end
end
