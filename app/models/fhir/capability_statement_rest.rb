module FHIR
  # fhir/capability_statement_rest.rb
  class CapabilityStatementRest < BackboneElement
    include Mongoid::Document
    embeds_one :mode, class_name: 'RestfulCapabilityMode'
    embeds_one :documentation, class_name: 'PrimitiveMarkdown'
    embeds_one :security, class_name: 'CapabilityStatementRestSecurity'
    embeds_many :resource, class_name: 'CapabilityStatementRestResource'
    embeds_many :interaction, class_name: 'CapabilityStatementRestInteraction'
    embeds_many :searchParam, class_name: 'CapabilityStatementRestResourceSearchParam'
    embeds_many :operation, class_name: 'CapabilityStatementRestResourceOperation'
    embeds_many :compartment, class_name: 'PrimitiveCanonical'

    def self.transform_json(json_hash, target = CapabilityStatementRest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['mode'] = RestfulCapabilityMode.transform_json(json_hash['mode']) unless json_hash['mode'].nil?      
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      
      result['security'] = CapabilityStatementRestSecurity.transform_json(json_hash['security']) unless json_hash['security'].nil?      
      result['resource'] = json_hash['resource'].map { |var| CapabilityStatementRestResource.transform_json(var) } unless json_hash['resource'].nil?
      result['interaction'] = json_hash['interaction'].map { |var| CapabilityStatementRestInteraction.transform_json(var) } unless json_hash['interaction'].nil?
      result['searchParam'] = json_hash['searchParam'].map { |var| CapabilityStatementRestResourceSearchParam.transform_json(var) } unless json_hash['searchParam'].nil?
      result['operation'] = json_hash['operation'].map { |var| CapabilityStatementRestResourceOperation.transform_json(var) } unless json_hash['operation'].nil?
      result['compartment'] = json_hash['compartment'].each_with_index.map do |var, i|
        extension_hash = json_hash['_compartment'] && json_hash['_compartment'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['compartment'].nil?

      result
    end
  end
end
