module FHIR
  # fhir/device.rb
  class Device < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Device'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :definition, class_name: 'Reference'
    embeds_many :udiCarrier, class_name: 'DeviceUdiCarrier'
    embeds_one :status, class_name: 'FHIRDeviceStatus'
    embeds_many :statusReason, class_name: 'CodeableConcept'
    embeds_one :distinctIdentifier, class_name: 'PrimitiveString'
    embeds_one :manufacturer, class_name: 'PrimitiveString'
    embeds_one :manufactureDate, class_name: 'PrimitiveDateTime'
    embeds_one :expirationDate, class_name: 'PrimitiveDateTime'
    embeds_one :lotNumber, class_name: 'PrimitiveString'
    embeds_one :serialNumber, class_name: 'PrimitiveString'
    embeds_many :deviceName, class_name: 'DeviceDeviceName'
    embeds_one :modelNumber, class_name: 'PrimitiveString'
    embeds_one :partNumber, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :specialization, class_name: 'DeviceSpecialization'
    embeds_many :version, class_name: 'DeviceVersion'
    embeds_many :property, class_name: 'DeviceProperty'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :owner, class_name: 'Reference'
    embeds_many :contact, class_name: 'ContactPoint'
    embeds_one :location, class_name: 'Reference'
    embeds_one :url, class_name: 'PrimitiveUri'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :safety, class_name: 'CodeableConcept'
    embeds_one :parent, class_name: 'Reference'

    def self.transform_json(json_hash, target=Device.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['definition'] = Reference.transform_json(json_hash['definition']) unless json_hash['definition'].nil?      
      result['udiCarrier'] = json_hash['udiCarrier'].map { |var| DeviceUdiCarrier.transform_json(var) } unless json_hash['udiCarrier'].nil?
      result['status'] = FHIRDeviceStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusReason'] = json_hash['statusReason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['statusReason'].nil?
      result['distinctIdentifier'] = PrimitiveString.transform_json(json_hash['distinctIdentifier'], json_hash['_distinctIdentifier']) unless json_hash['distinctIdentifier'].nil?      
      result['manufacturer'] = PrimitiveString.transform_json(json_hash['manufacturer'], json_hash['_manufacturer']) unless json_hash['manufacturer'].nil?      
      result['manufactureDate'] = PrimitiveDateTime.transform_json(json_hash['manufactureDate'], json_hash['_manufactureDate']) unless json_hash['manufactureDate'].nil?      
      result['expirationDate'] = PrimitiveDateTime.transform_json(json_hash['expirationDate'], json_hash['_expirationDate']) unless json_hash['expirationDate'].nil?      
      result['lotNumber'] = PrimitiveString.transform_json(json_hash['lotNumber'], json_hash['_lotNumber']) unless json_hash['lotNumber'].nil?      
      result['serialNumber'] = PrimitiveString.transform_json(json_hash['serialNumber'], json_hash['_serialNumber']) unless json_hash['serialNumber'].nil?      
      result['deviceName'] = json_hash['deviceName'].map { |var| DeviceDeviceName.transform_json(var) } unless json_hash['deviceName'].nil?
      result['modelNumber'] = PrimitiveString.transform_json(json_hash['modelNumber'], json_hash['_modelNumber']) unless json_hash['modelNumber'].nil?      
      result['partNumber'] = PrimitiveString.transform_json(json_hash['partNumber'], json_hash['_partNumber']) unless json_hash['partNumber'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['specialization'] = json_hash['specialization'].map { |var| DeviceSpecialization.transform_json(var) } unless json_hash['specialization'].nil?
      result['version'] = json_hash['version'].map { |var| DeviceVersion.transform_json(var) } unless json_hash['version'].nil?
      result['property'] = json_hash['property'].map { |var| DeviceProperty.transform_json(var) } unless json_hash['property'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['owner'] = Reference.transform_json(json_hash['owner']) unless json_hash['owner'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactPoint.transform_json(var) } unless json_hash['contact'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?      
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['safety'] = json_hash['safety'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['safety'].nil?
      result['parent'] = Reference.transform_json(json_hash['parent']) unless json_hash['parent'].nil?      

      result
    end
  end
end
