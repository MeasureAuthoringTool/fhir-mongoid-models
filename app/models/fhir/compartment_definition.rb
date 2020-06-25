module FHIR
  # fhir/compartment_definition.rb
  class CompartmentDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CompartmentDefinition'
    embeds_one :url, class_name: 'PrimitiveUri'
    embeds_one :version, class_name: 'PrimitiveString'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_one :experimental, class_name: 'PrimitiveBoolean'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :publisher, class_name: 'PrimitiveString'
    embeds_many :contact, class_name: 'ContactDetail'
    embeds_one :description, class_name: 'PrimitiveMarkdown'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_one :purpose, class_name: 'PrimitiveMarkdown'
    embeds_one :code, class_name: 'CompartmentType'
    embeds_one :search, class_name: 'PrimitiveBoolean'
    embeds_many :resource, class_name: 'CompartmentDefinitionResource'

    def self.transform_json(json_hash)
      result = CompartmentDefinition.new
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['purpose'] = PrimitiveMarkdown.transform_json(json_hash['purpose'], json_hash['_purpose']) unless json_hash['purpose'].nil?      
      result['code'] = CompartmentType.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['search'] = PrimitiveBoolean.transform_json(json_hash['search'], json_hash['_search']) unless json_hash['search'].nil?      
      result['resource'] = json_hash['resource'].map { |var| CompartmentDefinitionResource.transform_json(var) } unless json_hash['resource'].nil?

      result
    end
  end
end
