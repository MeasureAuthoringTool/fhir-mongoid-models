module FHIR
  # fhir/search_parameter.rb
  class SearchParameter < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'PrimitiveUri'
    embeds_one :version, class_name: 'PrimitiveString'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :derivedFrom, class_name: 'PrimitiveCanonical'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_one :experimental, class_name: 'PrimitiveBoolean'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :publisher, class_name: 'PrimitiveString'
    embeds_many :contact, class_name: 'ContactDetail'
    embeds_one :description, class_name: 'PrimitiveMarkdown'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    embeds_one :purpose, class_name: 'PrimitiveMarkdown'
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_many :base, class_name: 'ResourceType'
    embeds_one :type, class_name: 'SearchParamType'
    embeds_one :expression, class_name: 'PrimitiveString'
    embeds_one :xpath, class_name: 'PrimitiveString'
    embeds_one :xpathUsage, class_name: 'XPathUsageType'
    embeds_many :target, class_name: 'ResourceType'
    embeds_one :multipleOr, class_name: 'PrimitiveBoolean'
    embeds_one :multipleAnd, class_name: 'PrimitiveBoolean'
    embeds_many :comparator, class_name: 'SearchComparator'
    embeds_many :modifier, class_name: 'SearchModifierCode'
    embeds_many :chain, class_name: 'PrimitiveString'
    embeds_many :component, class_name: 'SearchParameterComponent'

    def self.transform_json(json_hash, target = SearchParameter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['derivedFrom'] = PrimitiveCanonical.transform_json(json_hash['derivedFrom'], json_hash['_derivedFrom']) unless json_hash['derivedFrom'].nil?      
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['purpose'] = PrimitiveMarkdown.transform_json(json_hash['purpose'], json_hash['_purpose']) unless json_hash['purpose'].nil?      
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['base'] = json_hash['base'].map { |var| ResourceType.transform_json(var) } unless json_hash['base'].nil?
      result['type'] = SearchParamType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?      
      result['xpath'] = PrimitiveString.transform_json(json_hash['xpath'], json_hash['_xpath']) unless json_hash['xpath'].nil?      
      result['xpathUsage'] = XPathUsageType.transform_json(json_hash['xpathUsage']) unless json_hash['xpathUsage'].nil?      
      result['target'] = json_hash['target'].map { |var| ResourceType.transform_json(var) } unless json_hash['target'].nil?
      result['multipleOr'] = PrimitiveBoolean.transform_json(json_hash['multipleOr'], json_hash['_multipleOr']) unless json_hash['multipleOr'].nil?      
      result['multipleAnd'] = PrimitiveBoolean.transform_json(json_hash['multipleAnd'], json_hash['_multipleAnd']) unless json_hash['multipleAnd'].nil?      
      result['comparator'] = json_hash['comparator'].map { |var| SearchComparator.transform_json(var) } unless json_hash['comparator'].nil?
      result['modifier'] = json_hash['modifier'].map { |var| SearchModifierCode.transform_json(var) } unless json_hash['modifier'].nil?
      result['chain'] = json_hash['chain'].each_with_index.map do |var, i|
        extension_hash = json_hash['_chain'] && json_hash['_chain'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['chain'].nil?
      result['component'] = json_hash['component'].map { |var| SearchParameterComponent.transform_json(var) } unless json_hash['component'].nil?

      result
    end
  end
end
