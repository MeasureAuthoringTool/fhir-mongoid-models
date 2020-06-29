module FHIR
  # fhir/patient_contact.rb
  class PatientContact < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PatientContact'
    embeds_many :relationship, class_name: 'CodeableConcept'
    embeds_one :name, class_name: 'HumanName'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_one :address, class_name: 'Address'
    embeds_one :gender, class_name: 'AdministrativeGender'
    embeds_one :organization, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'

    def self.transform_json(json_hash, target=PatientContact.new)
      result = self.superclass.transform_json(json_hash, target)
      result['relationship'] = json_hash['relationship'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['relationship'].nil?
      result['name'] = HumanName.transform_json(json_hash['name']) unless json_hash['name'].nil?      
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['address'] = Address.transform_json(json_hash['address']) unless json_hash['address'].nil?      
      result['gender'] = AdministrativeGender.transform_json(json_hash['gender']) unless json_hash['gender'].nil?      
      result['organization'] = Reference.transform_json(json_hash['organization']) unless json_hash['organization'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
