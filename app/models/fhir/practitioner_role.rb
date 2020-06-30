module FHIR
  # fhir/practitioner_role.rb
  class PractitionerRole < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'PractitionerRole'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :active, class_name: 'PrimitiveBoolean'
    embeds_one :period, class_name: 'Period'
    embeds_one :practitioner, class_name: 'Reference'
    embeds_one :organization, class_name: 'Reference'
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_many :specialty, class_name: 'CodeableConcept'
    embeds_many :location, class_name: 'Reference'
    embeds_many :healthcareService, class_name: 'Reference'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_many :availableTime, class_name: 'PractitionerRoleAvailableTime'
    embeds_many :notAvailable, class_name: 'PractitionerRoleNotAvailable'
    embeds_one :availabilityExceptions, class_name: 'PrimitiveString'
    embeds_many :endpoint, class_name: 'Reference'

    def self.transform_json(json_hash, target=PractitionerRole.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['practitioner'] = Reference.transform_json(json_hash['practitioner']) unless json_hash['practitioner'].nil?      
      result['organization'] = Reference.transform_json(json_hash['organization']) unless json_hash['organization'].nil?      
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['specialty'] = json_hash['specialty'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['specialty'].nil?
      result['location'] = json_hash['location'].map { |var| Reference.transform_json(var) } unless json_hash['location'].nil?
      result['healthcareService'] = json_hash['healthcareService'].map { |var| Reference.transform_json(var) } unless json_hash['healthcareService'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['availableTime'] = json_hash['availableTime'].map { |var| PractitionerRoleAvailableTime.transform_json(var) } unless json_hash['availableTime'].nil?
      result['notAvailable'] = json_hash['notAvailable'].map { |var| PractitionerRoleNotAvailable.transform_json(var) } unless json_hash['notAvailable'].nil?
      result['availabilityExceptions'] = PrimitiveString.transform_json(json_hash['availabilityExceptions'], json_hash['_availabilityExceptions']) unless json_hash['availabilityExceptions'].nil?      
      result['endpoint'] = json_hash['endpoint'].map { |var| Reference.transform_json(var) } unless json_hash['endpoint'].nil?

      result
    end
  end
end
