module FHIR
  # fhir/terminology_capabilities.rb
  class TerminologyCapabilities < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'PrimitiveUri'
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
    embeds_one :kind, class_name: 'CapabilityStatementKind'
    embeds_one :software, class_name: 'TerminologyCapabilitiesSoftware'
    embeds_one :implementation, class_name: 'TerminologyCapabilitiesImplementation'
    embeds_one :lockedDate, class_name: 'PrimitiveBoolean'
    embeds_many :codeSystem, class_name: 'TerminologyCapabilitiesCodeSystem'
    embeds_one :expansion, class_name: 'TerminologyCapabilitiesExpansion'
    embeds_one :codeSearch, class_name: 'CodeSearchSupport'
    embeds_one :validateCode, class_name: 'TerminologyCapabilitiesValidateCode'
    embeds_one :translation, class_name: 'TerminologyCapabilitiesTranslation'
    embeds_one :closure, class_name: 'TerminologyCapabilitiesClosure'

    def self.transform_json(json_hash, target = TerminologyCapabilities.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
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
      result['kind'] = CapabilityStatementKind.transform_json(json_hash['kind']) unless json_hash['kind'].nil?      
      result['software'] = TerminologyCapabilitiesSoftware.transform_json(json_hash['software']) unless json_hash['software'].nil?      
      result['implementation'] = TerminologyCapabilitiesImplementation.transform_json(json_hash['implementation']) unless json_hash['implementation'].nil?      
      result['lockedDate'] = PrimitiveBoolean.transform_json(json_hash['lockedDate'], json_hash['_lockedDate']) unless json_hash['lockedDate'].nil?      
      result['codeSystem'] = json_hash['codeSystem'].map { |var| TerminologyCapabilitiesCodeSystem.transform_json(var) } unless json_hash['codeSystem'].nil?
      result['expansion'] = TerminologyCapabilitiesExpansion.transform_json(json_hash['expansion']) unless json_hash['expansion'].nil?      
      result['codeSearch'] = CodeSearchSupport.transform_json(json_hash['codeSearch']) unless json_hash['codeSearch'].nil?      
      result['validateCode'] = TerminologyCapabilitiesValidateCode.transform_json(json_hash['validateCode']) unless json_hash['validateCode'].nil?      
      result['translation'] = TerminologyCapabilitiesTranslation.transform_json(json_hash['translation']) unless json_hash['translation'].nil?      
      result['closure'] = TerminologyCapabilitiesClosure.transform_json(json_hash['closure']) unless json_hash['closure'].nil?      

      result
    end
  end
end
