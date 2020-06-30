module FHIR
  # fhir/operation_definition.rb
  class OperationDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationDefinition'
    embeds_one :url, class_name: 'PrimitiveUri'
    embeds_one :version, class_name: 'PrimitiveString'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :title, class_name: 'PrimitiveString'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_one :kind, class_name: 'OperationKind'
    embeds_one :experimental, class_name: 'PrimitiveBoolean'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :publisher, class_name: 'PrimitiveString'
    embeds_many :contact, class_name: 'ContactDetail'
    embeds_one :description, class_name: 'PrimitiveMarkdown'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    embeds_one :purpose, class_name: 'PrimitiveMarkdown'
    embeds_one :affectsState, class_name: 'PrimitiveBoolean'
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :comment, class_name: 'PrimitiveMarkdown'
    embeds_one :base, class_name: 'PrimitiveCanonical'
    embeds_many :resource, class_name: 'ResourceType'
    embeds_one :system, class_name: 'PrimitiveBoolean'
    embeds_one :type, class_name: 'PrimitiveBoolean'
    embeds_one :instance, class_name: 'PrimitiveBoolean'
    embeds_one :inputProfile, class_name: 'PrimitiveCanonical'
    embeds_one :outputProfile, class_name: 'PrimitiveCanonical'
    embeds_many :parameter, class_name: 'OperationDefinitionParameter'
    embeds_many :overload, class_name: 'OperationDefinitionOverload'

    def self.transform_json(json_hash, target=OperationDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['kind'] = OperationKind.transform_json(json_hash['kind']) unless json_hash['kind'].nil?      
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['purpose'] = PrimitiveMarkdown.transform_json(json_hash['purpose'], json_hash['_purpose']) unless json_hash['purpose'].nil?      
      result['affectsState'] = PrimitiveBoolean.transform_json(json_hash['affectsState'], json_hash['_affectsState']) unless json_hash['affectsState'].nil?      
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['comment'] = PrimitiveMarkdown.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      
      result['base'] = PrimitiveCanonical.transform_json(json_hash['base'], json_hash['_base']) unless json_hash['base'].nil?      
      result['resource'] = json_hash['resource'].map { |var| ResourceType.transform_json(var) } unless json_hash['resource'].nil?
      result['system'] = PrimitiveBoolean.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?      
      result['type'] = PrimitiveBoolean.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?      
      result['instance'] = PrimitiveBoolean.transform_json(json_hash['instance'], json_hash['_instance']) unless json_hash['instance'].nil?      
      result['inputProfile'] = PrimitiveCanonical.transform_json(json_hash['inputProfile'], json_hash['_inputProfile']) unless json_hash['inputProfile'].nil?      
      result['outputProfile'] = PrimitiveCanonical.transform_json(json_hash['outputProfile'], json_hash['_outputProfile']) unless json_hash['outputProfile'].nil?      
      result['parameter'] = json_hash['parameter'].map { |var| OperationDefinitionParameter.transform_json(var) } unless json_hash['parameter'].nil?
      result['overload'] = json_hash['overload'].map { |var| OperationDefinitionOverload.transform_json(var) } unless json_hash['overload'].nil?

      result
    end
  end
end
