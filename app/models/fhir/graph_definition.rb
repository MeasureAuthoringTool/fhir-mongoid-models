module FHIR
  # fhir/graph_definition.rb
  class GraphDefinition < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'
    embeds_one :version, class_name: 'FHIR::PrimitiveString'
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :status, class_name: 'FHIR::PublicationStatus'
    embeds_one :experimental, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :publisher, class_name: 'FHIR::PrimitiveString'
    embeds_many :contact, class_name: 'FHIR::ContactDetail'
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_many :useContext, class_name: 'FHIR::UsageContext'
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'
    embeds_one :purpose, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_one :start, class_name: 'FHIR::ResourceType'
    embeds_one :profile, class_name: 'FHIR::PrimitiveCanonical'
    embeds_many :link, class_name: 'FHIR::GraphDefinitionLink'

    def self.transform_json(json_hash, target = GraphDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
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
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['purpose'] = PrimitiveMarkdown.transform_json(json_hash['purpose'], json_hash['_purpose']) unless json_hash['purpose'].nil?      
      result['start'] = ResourceType.transform_json(json_hash['start']) unless json_hash['start'].nil?      
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?      
      result['link'] = json_hash['link'].map { |var| GraphDefinitionLink.transform_json(var) } unless json_hash['link'].nil?

      result
    end
  end
end
