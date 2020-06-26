module FHIR
  # fhir/organization_contact.rb
  class OrganizationContact < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'OrganizationContact'
    embeds_one :purpose, class_name: 'CodeableConcept'
    embeds_one :name, class_name: 'HumanName'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_one :address, class_name: 'Address'

    def self.transform_json(json_hash)
      result = OrganizationContact.new
      result['purpose'] = CodeableConcept.transform_json(json_hash['purpose']) unless json_hash['purpose'].nil?      
      result['name'] = HumanName.transform_json(json_hash['name']) unless json_hash['name'].nil?      
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['address'] = Address.transform_json(json_hash['address']) unless json_hash['address'].nil?      

      result
    end
  end
end
