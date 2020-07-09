module FHIR
  # fhir/location.rb
  class Location < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :status, class_name: 'FHIR::LocationStatus'
    embeds_one :operationalStatus, class_name: 'FHIR::Coding'
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_many :alias, class_name: 'FHIR::PrimitiveString'
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_one :mode, class_name: 'FHIR::LocationMode'
    embeds_many :type, class_name: 'FHIR::CodeableConcept'
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'
    embeds_one :address, class_name: 'FHIR::Address'
    embeds_one :physicalType, class_name: 'FHIR::CodeableConcept'
    embeds_one :position, class_name: 'FHIR::LocationPosition'
    embeds_one :managingOrganization, class_name: 'FHIR::Reference'
    embeds_one :partOf, class_name: 'FHIR::Reference'
    embeds_many :hoursOfOperation, class_name: 'FHIR::LocationHoursOfOperation'
    embeds_one :availabilityExceptions, class_name: 'FHIR::PrimitiveString'
    embeds_many :endpoint, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = Location.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = LocationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['operationalStatus'] = Coding.transform_json(json_hash['operationalStatus']) unless json_hash['operationalStatus'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['alias'] = json_hash['alias'].each_with_index.map do |var, i|
        extension_hash = json_hash['_alias'] && json_hash['_alias'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['alias'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['mode'] = LocationMode.transform_json(json_hash['mode']) unless json_hash['mode'].nil?      
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['address'] = Address.transform_json(json_hash['address']) unless json_hash['address'].nil?      
      result['physicalType'] = CodeableConcept.transform_json(json_hash['physicalType']) unless json_hash['physicalType'].nil?      
      result['position'] = LocationPosition.transform_json(json_hash['position']) unless json_hash['position'].nil?      
      result['managingOrganization'] = Reference.transform_json(json_hash['managingOrganization']) unless json_hash['managingOrganization'].nil?      
      result['partOf'] = Reference.transform_json(json_hash['partOf']) unless json_hash['partOf'].nil?      
      result['hoursOfOperation'] = json_hash['hoursOfOperation'].map { |var| LocationHoursOfOperation.transform_json(var) } unless json_hash['hoursOfOperation'].nil?
      result['availabilityExceptions'] = PrimitiveString.transform_json(json_hash['availabilityExceptions'], json_hash['_availabilityExceptions']) unless json_hash['availabilityExceptions'].nil?      
      result['endpoint'] = json_hash['endpoint'].map { |var| Reference.transform_json(var) } unless json_hash['endpoint'].nil?

      result
    end
  end
end
