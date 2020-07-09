module FHIR
  # fhir/organization.rb
  class Organization < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'
    embeds_many :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_many :alias, class_name: 'FHIR::PrimitiveString'
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'
    embeds_many :address, class_name: 'FHIR::Address'
    embeds_one :partOf, class_name: 'FHIR::Reference'
    embeds_many :contact, class_name: 'FHIR::OrganizationContact'
    embeds_many :endpoint, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = Organization.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?      
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['alias'] = json_hash['alias'].each_with_index.map do |var, i|
        extension_hash = json_hash['_alias'] && json_hash['_alias'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['alias'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['address'] = json_hash['address'].map { |var| Address.transform_json(var) } unless json_hash['address'].nil?
      result['partOf'] = Reference.transform_json(json_hash['partOf']) unless json_hash['partOf'].nil?      
      result['contact'] = json_hash['contact'].map { |var| OrganizationContact.transform_json(var) } unless json_hash['contact'].nil?
      result['endpoint'] = json_hash['endpoint'].map { |var| Reference.transform_json(var) } unless json_hash['endpoint'].nil?

      result
    end
  end
end
