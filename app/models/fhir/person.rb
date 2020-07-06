module FHIR
  # fhir/person.rb
  class Person < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :name, class_name: 'HumanName'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_one :gender, class_name: 'AdministrativeGender'
    embeds_one :birthDate, class_name: 'PrimitiveDate'
    embeds_many :address, class_name: 'Address'
    embeds_one :photo, class_name: 'Attachment'
    embeds_one :managingOrganization, class_name: 'Reference'
    embeds_one :active, class_name: 'PrimitiveBoolean'
    embeds_many :link, class_name: 'PersonLink'

    def self.transform_json(json_hash, target = Person.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['name'] = json_hash['name'].map { |var| HumanName.transform_json(var) } unless json_hash['name'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['gender'] = AdministrativeGender.transform_json(json_hash['gender']) unless json_hash['gender'].nil?      
      result['birthDate'] = PrimitiveDate.transform_json(json_hash['birthDate'], json_hash['_birthDate']) unless json_hash['birthDate'].nil?      
      result['address'] = json_hash['address'].map { |var| Address.transform_json(var) } unless json_hash['address'].nil?
      result['photo'] = Attachment.transform_json(json_hash['photo']) unless json_hash['photo'].nil?      
      result['managingOrganization'] = Reference.transform_json(json_hash['managingOrganization']) unless json_hash['managingOrganization'].nil?      
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?      
      result['link'] = json_hash['link'].map { |var| PersonLink.transform_json(var) } unless json_hash['link'].nil?

      result
    end
  end
end
