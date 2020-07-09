module FHIR
  # fhir/message_definition.rb
  class MessageDefinition < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :version, class_name: 'FHIR::PrimitiveString'
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :title, class_name: 'FHIR::PrimitiveString'
    embeds_many :replaces, class_name: 'FHIR::PrimitiveCanonical'
    embeds_one :status, class_name: 'FHIR::PublicationStatus'
    embeds_one :experimental, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :publisher, class_name: 'FHIR::PrimitiveString'
    embeds_many :contact, class_name: 'FHIR::ContactDetail'
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_many :useContext, class_name: 'FHIR::UsageContext'
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'
    embeds_one :purpose, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_one :copyright, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_one :base, class_name: 'FHIR::PrimitiveCanonical'
    embeds_many :parent, class_name: 'FHIR::PrimitiveCanonical'
    embeds_one :eventCoding, class_name: 'FHIR::Coding'
    embeds_one :eventUri, class_name: 'FHIR::PrimitiveUri'
    embeds_one :category, class_name: 'FHIR::MessageSignificanceCategory'
    embeds_many :focus, class_name: 'FHIR::MessageDefinitionFocus'
    embeds_one :responseRequired, class_name: 'FHIR::MessageheaderResponseRequest'
    embeds_many :allowedResponse, class_name: 'FHIR::MessageDefinitionAllowedResponse'
    embeds_many :graph, class_name: 'FHIR::PrimitiveCanonical'

    def self.transform_json(json_hash, target = MessageDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['replaces'] = json_hash['replaces'].each_with_index.map do |var, i|
        extension_hash = json_hash['_replaces'] && json_hash['_replaces'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['replaces'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['purpose'] = PrimitiveMarkdown.transform_json(json_hash['purpose'], json_hash['_purpose']) unless json_hash['purpose'].nil?      
      result['copyright'] = PrimitiveMarkdown.transform_json(json_hash['copyright'], json_hash['_copyright']) unless json_hash['copyright'].nil?      
      result['base'] = PrimitiveCanonical.transform_json(json_hash['base'], json_hash['_base']) unless json_hash['base'].nil?      
      result['parent'] = json_hash['parent'].each_with_index.map do |var, i|
        extension_hash = json_hash['_parent'] && json_hash['_parent'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['parent'].nil?
      result['eventCoding'] = Coding.transform_json(json_hash['eventCoding']) unless json_hash['eventCoding'].nil?      
      result['eventUri'] = PrimitiveUri.transform_json(json_hash['eventUri'], json_hash['_eventUri']) unless json_hash['eventUri'].nil?      
      result['category'] = MessageSignificanceCategory.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['focus'] = json_hash['focus'].map { |var| MessageDefinitionFocus.transform_json(var) } unless json_hash['focus'].nil?
      result['responseRequired'] = MessageheaderResponseRequest.transform_json(json_hash['responseRequired']) unless json_hash['responseRequired'].nil?      
      result['allowedResponse'] = json_hash['allowedResponse'].map { |var| MessageDefinitionAllowedResponse.transform_json(var) } unless json_hash['allowedResponse'].nil?
      result['graph'] = json_hash['graph'].each_with_index.map do |var, i|
        extension_hash = json_hash['_graph'] && json_hash['_graph'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['graph'].nil?

      result
    end
  end
end
