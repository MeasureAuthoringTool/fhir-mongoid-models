module FHIR
  # fhir/capability_statement_rest_resource.rb
  class CapabilityStatementRestResource < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ResourceType'    
    embeds_one :profile, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :supportedProfile, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :interaction, class_name: 'FHIR::CapabilityStatementRestResourceInteraction'    
    embeds_one :versioning, class_name: 'FHIR::ResourceVersionPolicy'    
    embeds_one :readHistory, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :updateCreate, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :conditionalCreate, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :conditionalRead, class_name: 'FHIR::ConditionalReadStatus'    
    embeds_one :conditionalUpdate, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :conditionalDelete, class_name: 'FHIR::ConditionalDeleteStatus'    
    embeds_many :referencePolicy, class_name: 'FHIR::ReferenceHandlingPolicy'    
    embeds_many :searchInclude, class_name: 'FHIR::PrimitiveString'    
    embeds_many :searchRevInclude, class_name: 'FHIR::PrimitiveString'    
    embeds_many :searchParam, class_name: 'FHIR::CapabilityStatementRestResourceSearchParam'    
    embeds_many :operation, class_name: 'FHIR::CapabilityStatementRestResourceOperation'    

    def self.transform_json(json_hash, target = CapabilityStatementRestResource.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ResourceType.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?
      result['supportedProfile'] = json_hash['supportedProfile'].each_with_index.map do |var, i|
        extension_hash = json_hash['_supportedProfile'] && json_hash['_supportedProfile'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['supportedProfile'].nil?
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?
      result['interaction'] = json_hash['interaction'].map { |var| CapabilityStatementRestResourceInteraction.transform_json(var) } unless json_hash['interaction'].nil?
      result['versioning'] = ResourceVersionPolicy.transform_json(json_hash['versioning']) unless json_hash['versioning'].nil?
      result['readHistory'] = PrimitiveBoolean.transform_json(json_hash['readHistory'], json_hash['_readHistory']) unless json_hash['readHistory'].nil?
      result['updateCreate'] = PrimitiveBoolean.transform_json(json_hash['updateCreate'], json_hash['_updateCreate']) unless json_hash['updateCreate'].nil?
      result['conditionalCreate'] = PrimitiveBoolean.transform_json(json_hash['conditionalCreate'], json_hash['_conditionalCreate']) unless json_hash['conditionalCreate'].nil?
      result['conditionalRead'] = ConditionalReadStatus.transform_json(json_hash['conditionalRead']) unless json_hash['conditionalRead'].nil?
      result['conditionalUpdate'] = PrimitiveBoolean.transform_json(json_hash['conditionalUpdate'], json_hash['_conditionalUpdate']) unless json_hash['conditionalUpdate'].nil?
      result['conditionalDelete'] = ConditionalDeleteStatus.transform_json(json_hash['conditionalDelete']) unless json_hash['conditionalDelete'].nil?
      result['referencePolicy'] = json_hash['referencePolicy'].map { |var| ReferenceHandlingPolicy.transform_json(var) } unless json_hash['referencePolicy'].nil?
      result['searchInclude'] = json_hash['searchInclude'].each_with_index.map do |var, i|
        extension_hash = json_hash['_searchInclude'] && json_hash['_searchInclude'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['searchInclude'].nil?
      result['searchRevInclude'] = json_hash['searchRevInclude'].each_with_index.map do |var, i|
        extension_hash = json_hash['_searchRevInclude'] && json_hash['_searchRevInclude'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['searchRevInclude'].nil?
      result['searchParam'] = json_hash['searchParam'].map { |var| CapabilityStatementRestResourceSearchParam.transform_json(var) } unless json_hash['searchParam'].nil?
      result['operation'] = json_hash['operation'].map { |var| CapabilityStatementRestResourceOperation.transform_json(var) } unless json_hash['operation'].nil?

      result
    end
  end
end
