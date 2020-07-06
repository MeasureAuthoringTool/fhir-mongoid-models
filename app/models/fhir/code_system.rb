module FHIR
  # fhir/code_system.rb
  class CodeSystem < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'PrimitiveUri'
    embeds_many :identifier, class_name: 'Identifier'
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
    embeds_one :caseSensitive, class_name: 'PrimitiveBoolean'
    embeds_one :valueSet, class_name: 'PrimitiveCanonical'
    embeds_one :hierarchyMeaning, class_name: 'CodeSystemHierarchyMeaning'
    embeds_one :compositional, class_name: 'PrimitiveBoolean'
    embeds_one :versionNeeded, class_name: 'PrimitiveBoolean'
    embeds_one :content, class_name: 'CodeSystemContentMode'
    embeds_one :supplements, class_name: 'PrimitiveCanonical'
    embeds_one :count, class_name: 'PrimitiveUnsignedInt'
    embeds_many :filter, class_name: 'CodeSystemFilter'
    embeds_many :property, class_name: 'CodeSystemProperty'
    embeds_many :concept, class_name: 'CodeSystemConcept'

    def self.transform_json(json_hash, target = CodeSystem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
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
      result['caseSensitive'] = PrimitiveBoolean.transform_json(json_hash['caseSensitive'], json_hash['_caseSensitive']) unless json_hash['caseSensitive'].nil?      
      result['valueSet'] = PrimitiveCanonical.transform_json(json_hash['valueSet'], json_hash['_valueSet']) unless json_hash['valueSet'].nil?      
      result['hierarchyMeaning'] = CodeSystemHierarchyMeaning.transform_json(json_hash['hierarchyMeaning']) unless json_hash['hierarchyMeaning'].nil?      
      result['compositional'] = PrimitiveBoolean.transform_json(json_hash['compositional'], json_hash['_compositional']) unless json_hash['compositional'].nil?      
      result['versionNeeded'] = PrimitiveBoolean.transform_json(json_hash['versionNeeded'], json_hash['_versionNeeded']) unless json_hash['versionNeeded'].nil?      
      result['content'] = CodeSystemContentMode.transform_json(json_hash['content']) unless json_hash['content'].nil?      
      result['supplements'] = PrimitiveCanonical.transform_json(json_hash['supplements'], json_hash['_supplements']) unless json_hash['supplements'].nil?      
      result['count'] = PrimitiveUnsignedInt.transform_json(json_hash['count'], json_hash['_count']) unless json_hash['count'].nil?      
      result['filter'] = json_hash['filter'].map { |var| CodeSystemFilter.transform_json(var) } unless json_hash['filter'].nil?
      result['property'] = json_hash['property'].map { |var| CodeSystemProperty.transform_json(var) } unless json_hash['property'].nil?
      result['concept'] = json_hash['concept'].map { |var| CodeSystemConcept.transform_json(var) } unless json_hash['concept'].nil?

      result
    end
  end
end
