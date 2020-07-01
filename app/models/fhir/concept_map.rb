module FHIR
  # fhir/concept_map.rb
  class ConceptMap < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'PrimitiveUri'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :version, class_name: 'PrimitiveString'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :title, class_name: 'PrimitiveString'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_one :experimental, class_name: 'PrimitiveBoolean'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :publisher, class_name: 'PrimitiveString'
    embeds_many :contact, class_name: 'ContactDetail'
    embeds_one :description, class_name: 'PrimitiveMarkdown'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    embeds_one :purpose, class_name: 'PrimitiveMarkdown'
    embeds_one :copyright, class_name: 'PrimitiveMarkdown'
    embeds_one :sourceUri, class_name: 'PrimitiveUri'
    embeds_one :sourceCanonical, class_name: 'PrimitiveCanonical'
    embeds_one :targetUri, class_name: 'PrimitiveUri'
    embeds_one :targetCanonical, class_name: 'PrimitiveCanonical'
    embeds_many :group, class_name: 'ConceptMapGroup'

    def self.transform_json(json_hash, target = ConceptMap.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
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
      result['sourceUri'] = PrimitiveUri.transform_json(json_hash['sourceUri'], json_hash['_sourceUri']) unless json_hash['sourceUri'].nil?      
      result['sourceCanonical'] = PrimitiveCanonical.transform_json(json_hash['sourceCanonical'], json_hash['_sourceCanonical']) unless json_hash['sourceCanonical'].nil?      
      result['targetUri'] = PrimitiveUri.transform_json(json_hash['targetUri'], json_hash['_targetUri']) unless json_hash['targetUri'].nil?      
      result['targetCanonical'] = PrimitiveCanonical.transform_json(json_hash['targetCanonical'], json_hash['_targetCanonical']) unless json_hash['targetCanonical'].nil?      
      result['group'] = json_hash['group'].map { |var| ConceptMapGroup.transform_json(var) } unless json_hash['group'].nil?

      result
    end
  end
end
