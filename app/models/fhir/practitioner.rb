module FHIR
  # fhir/practitioner.rb
  class Practitioner < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :name, class_name: 'FHIR::HumanName'    
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'    
    embeds_many :address, class_name: 'FHIR::Address'    
    embeds_one :gender, class_name: 'FHIR::AdministrativeGender'    
    embeds_one :birthDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_many :photo, class_name: 'FHIR::Attachment'    
    embeds_many :qualification, class_name: 'FHIR::PractitionerQualification'    
    embeds_many :communication, class_name: 'FHIR::CodeableConcept'    

    def self.transform_json(json_hash, target = Practitioner.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?
      result['name'] = json_hash['name'].map { |var| HumanName.transform_json(var) } unless json_hash['name'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['address'] = json_hash['address'].map { |var| Address.transform_json(var) } unless json_hash['address'].nil?
      result['gender'] = AdministrativeGender.transform_json(json_hash['gender']) unless json_hash['gender'].nil?
      result['birthDate'] = PrimitiveDate.transform_json(json_hash['birthDate'], json_hash['_birthDate']) unless json_hash['birthDate'].nil?
      result['photo'] = json_hash['photo'].map { |var| Attachment.transform_json(var) } unless json_hash['photo'].nil?
      result['qualification'] = json_hash['qualification'].map { |var| PractitionerQualification.transform_json(var) } unless json_hash['qualification'].nil?
      result['communication'] = json_hash['communication'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['communication'].nil?

      result
    end
  end
end
