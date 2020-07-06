module FHIR
  # fhir/endpoint.rb
  class Endpoint < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'EndpointStatus'
    embeds_one :connectionType, class_name: 'Coding'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :managingOrganization, class_name: 'Reference'
    embeds_many :contact, class_name: 'ContactPoint'
    embeds_one :period, class_name: 'Period'
    embeds_many :payloadType, class_name: 'CodeableConcept'
    embeds_many :payloadMimeType, class_name: 'MimeType'
    embeds_one :address, class_name: 'PrimitiveUrl'
    embeds_many :header, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = Endpoint.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = EndpointStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['connectionType'] = Coding.transform_json(json_hash['connectionType']) unless json_hash['connectionType'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['managingOrganization'] = Reference.transform_json(json_hash['managingOrganization']) unless json_hash['managingOrganization'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactPoint.transform_json(var) } unless json_hash['contact'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['payloadType'] = json_hash['payloadType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['payloadType'].nil?
      result['payloadMimeType'] = json_hash['payloadMimeType'].map { |var| MimeType.transform_json(var) } unless json_hash['payloadMimeType'].nil?
      result['address'] = PrimitiveUrl.transform_json(json_hash['address'], json_hash['_address']) unless json_hash['address'].nil?      
      result['header'] = json_hash['header'].each_with_index.map do |var, i|
        extension_hash = json_hash['_header'] && json_hash['_header'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['header'].nil?

      result
    end
  end
end
