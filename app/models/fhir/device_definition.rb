module FHIR
  # fhir/device_definition.rb
  class DeviceDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceDefinition'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :udiDeviceIdentifier, class_name: 'DeviceDefinitionUdiDeviceIdentifier'
    embeds_one :manufacturerString, class_name: 'PrimitiveString'
    embeds_one :manufacturerReference, class_name: 'Reference'
    embeds_many :deviceName, class_name: 'DeviceDefinitionDeviceName'
    embeds_one :modelNumber, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :specialization, class_name: 'DeviceDefinitionSpecialization'
    embeds_many :version, class_name: 'PrimitiveString'
    embeds_many :safety, class_name: 'CodeableConcept'
    embeds_many :shelfLifeStorage, class_name: 'ProductShelfLife'
    embeds_one :physicalCharacteristics, class_name: 'ProdCharacteristic'
    embeds_many :languageCode, class_name: 'CodeableConcept'
    embeds_many :capability, class_name: 'DeviceDefinitionCapability'
    embeds_many :property, class_name: 'DeviceDefinitionProperty'
    embeds_one :owner, class_name: 'Reference'
    embeds_many :contact, class_name: 'ContactPoint'
    embeds_one :url, class_name: 'PrimitiveUri'
    embeds_one :onlineInformation, class_name: 'PrimitiveUri'
    embeds_many :note, class_name: 'Annotation'
    embeds_one :quantity, class_name: 'Quantity'
    embeds_one :parentDevice, class_name: 'Reference'
    embeds_many :material, class_name: 'DeviceDefinitionMaterial'

    def self.transform_json(json_hash, target=DeviceDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['udiDeviceIdentifier'] = json_hash['udiDeviceIdentifier'].map { |var| DeviceDefinitionUdiDeviceIdentifier.transform_json(var) } unless json_hash['udiDeviceIdentifier'].nil?
      result['manufacturerString'] = PrimitiveString.transform_json(json_hash['manufacturerString'], json_hash['_manufacturerString']) unless json_hash['manufacturerString'].nil?      
      result['manufacturerReference'] = Reference.transform_json(json_hash['manufacturerReference']) unless json_hash['manufacturerReference'].nil?      
      result['deviceName'] = json_hash['deviceName'].map { |var| DeviceDefinitionDeviceName.transform_json(var) } unless json_hash['deviceName'].nil?
      result['modelNumber'] = PrimitiveString.transform_json(json_hash['modelNumber'], json_hash['_modelNumber']) unless json_hash['modelNumber'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['specialization'] = json_hash['specialization'].map { |var| DeviceDefinitionSpecialization.transform_json(var) } unless json_hash['specialization'].nil?
      result['version'] = json_hash['version'].each_with_index.map do |var, i|
        extension_hash = json_hash['_version'] && json_hash['_version'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['version'].nil?
      result['safety'] = json_hash['safety'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['safety'].nil?
      result['shelfLifeStorage'] = json_hash['shelfLifeStorage'].map { |var| ProductShelfLife.transform_json(var) } unless json_hash['shelfLifeStorage'].nil?
      result['physicalCharacteristics'] = ProdCharacteristic.transform_json(json_hash['physicalCharacteristics']) unless json_hash['physicalCharacteristics'].nil?      
      result['languageCode'] = json_hash['languageCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['languageCode'].nil?
      result['capability'] = json_hash['capability'].map { |var| DeviceDefinitionCapability.transform_json(var) } unless json_hash['capability'].nil?
      result['property'] = json_hash['property'].map { |var| DeviceDefinitionProperty.transform_json(var) } unless json_hash['property'].nil?
      result['owner'] = Reference.transform_json(json_hash['owner']) unless json_hash['owner'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactPoint.transform_json(var) } unless json_hash['contact'].nil?
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['onlineInformation'] = PrimitiveUri.transform_json(json_hash['onlineInformation'], json_hash['_onlineInformation']) unless json_hash['onlineInformation'].nil?      
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['quantity'] = Quantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['parentDevice'] = Reference.transform_json(json_hash['parentDevice']) unless json_hash['parentDevice'].nil?      
      result['material'] = json_hash['material'].map { |var| DeviceDefinitionMaterial.transform_json(var) } unless json_hash['material'].nil?

      result
    end
  end
end
