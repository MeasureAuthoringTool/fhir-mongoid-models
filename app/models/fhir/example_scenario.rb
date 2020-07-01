module FHIR
  # fhir/example_scenario.rb
  class ExampleScenario < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'PrimitiveUri'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :version, class_name: 'PrimitiveString'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_one :experimental, class_name: 'PrimitiveBoolean'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :publisher, class_name: 'PrimitiveString'
    embeds_many :contact, class_name: 'ContactDetail'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    embeds_one :copyright, class_name: 'PrimitiveMarkdown'
    embeds_one :purpose, class_name: 'PrimitiveMarkdown'
    embeds_many :actor, class_name: 'ExampleScenarioActor'
    embeds_many :instance, class_name: 'ExampleScenarioInstance'
    embeds_many :process, class_name: 'ExampleScenarioProcess'
    embeds_many :workflow, class_name: 'PrimitiveCanonical'

    def self.transform_json(json_hash, target = ExampleScenario.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['copyright'] = PrimitiveMarkdown.transform_json(json_hash['copyright'], json_hash['_copyright']) unless json_hash['copyright'].nil?      
      result['purpose'] = PrimitiveMarkdown.transform_json(json_hash['purpose'], json_hash['_purpose']) unless json_hash['purpose'].nil?      
      result['actor'] = json_hash['actor'].map { |var| ExampleScenarioActor.transform_json(var) } unless json_hash['actor'].nil?
      result['instance'] = json_hash['instance'].map { |var| ExampleScenarioInstance.transform_json(var) } unless json_hash['instance'].nil?
      result['process'] = json_hash['process'].map { |var| ExampleScenarioProcess.transform_json(var) } unless json_hash['process'].nil?
      result['workflow'] = json_hash['workflow'].each_with_index.map do |var, i|
        extension_hash = json_hash['_workflow'] && json_hash['_workflow'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['workflow'].nil?

      result
    end
  end
end
