module FHIR
  # fhir/patient.rb
  class Patient < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Patient'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :active, class_name: 'PrimitiveBoolean'
    embeds_many :name, class_name: 'HumanName'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_one :gender, class_name: 'AdministrativeGender'
    embeds_one :birthDate, class_name: 'PrimitiveDate'
    embeds_one :deceasedboolean, class_name: 'PrimitiveBoolean'
    embeds_one :deceaseddateTime, class_name: 'PrimitiveDateTime'
    embeds_many :address, class_name: 'Address'
    embeds_one :maritalStatus, class_name: 'CodeableConcept'
    embeds_one :multipleBirthboolean, class_name: 'PrimitiveBoolean'
    embeds_one :multipleBirthinteger, class_name: 'PrimitiveInteger'
    embeds_many :photo, class_name: 'Attachment'
    embeds_many :contact, class_name: 'PatientContact'
    embeds_many :communication, class_name: 'PatientCommunication'
    embeds_many :generalPractitioner, class_name: 'Reference'
    embeds_one :managingOrganization, class_name: 'Reference'
    embeds_many :link, class_name: 'PatientLink'

    def self.transform_json(json_hash)
      result = Patient.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?      
      result['name'] = json_hash['name'].map { |var| HumanName.transform_json(var) } unless json_hash['name'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['gender'] = AdministrativeGender.transform_json(json_hash['gender']) unless json_hash['gender'].nil?      
      result['birthDate'] = PrimitiveDate.transform_json(json_hash['birthDate'], json_hash['_birthDate']) unless json_hash['birthDate'].nil?      
      result['deceasedboolean'] = PrimitiveBoolean.transform_json(json_hash['deceasedboolean'], json_hash['_deceasedboolean']) unless json_hash['deceasedboolean'].nil?      
      result['deceaseddateTime'] = PrimitiveDateTime.transform_json(json_hash['deceaseddateTime'], json_hash['_deceaseddateTime']) unless json_hash['deceaseddateTime'].nil?      
      result['address'] = json_hash['address'].map { |var| Address.transform_json(var) } unless json_hash['address'].nil?
      result['maritalStatus'] = CodeableConcept.transform_json(json_hash['maritalStatus']) unless json_hash['maritalStatus'].nil?      
      result['multipleBirthboolean'] = PrimitiveBoolean.transform_json(json_hash['multipleBirthboolean'], json_hash['_multipleBirthboolean']) unless json_hash['multipleBirthboolean'].nil?      
      result['multipleBirthinteger'] = PrimitiveInteger.transform_json(json_hash['multipleBirthinteger'], json_hash['_multipleBirthinteger']) unless json_hash['multipleBirthinteger'].nil?      
      result['photo'] = json_hash['photo'].map { |var| Attachment.transform_json(var) } unless json_hash['photo'].nil?
      result['contact'] = json_hash['contact'].map { |var| PatientContact.transform_json(var) } unless json_hash['contact'].nil?
      result['communication'] = json_hash['communication'].map { |var| PatientCommunication.transform_json(var) } unless json_hash['communication'].nil?
      result['generalPractitioner'] = json_hash['generalPractitioner'].map { |var| Reference.transform_json(var) } unless json_hash['generalPractitioner'].nil?
      result['managingOrganization'] = Reference.transform_json(json_hash['managingOrganization']) unless json_hash['managingOrganization'].nil?      
      result['link'] = json_hash['link'].map { |var| PatientLink.transform_json(var) } unless json_hash['link'].nil?

      result
    end
  end
end
