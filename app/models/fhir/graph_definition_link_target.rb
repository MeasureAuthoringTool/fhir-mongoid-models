module FHIR
  # fhir/graph_definition_link_target.rb
  class GraphDefinitionLinkTarget < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ResourceType'
    embeds_one :params, class_name: 'FHIR::PrimitiveString'
    embeds_one :profile, class_name: 'FHIR::PrimitiveCanonical'
    embeds_many :compartment, class_name: 'FHIR::GraphDefinitionLinkTargetCompartment'
    embeds_many :link, class_name: 'FHIR::GraphDefinitionLink'

    def self.transform_json(json_hash, target = GraphDefinitionLinkTarget.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ResourceType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['params'] = PrimitiveString.transform_json(json_hash['params'], json_hash['_params']) unless json_hash['params'].nil?      
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?      
      result['compartment'] = json_hash['compartment'].map { |var| GraphDefinitionLinkTargetCompartment.transform_json(var) } unless json_hash['compartment'].nil?
      result['link'] = json_hash['link'].map { |var| GraphDefinitionLink.transform_json(var) } unless json_hash['link'].nil?

      result
    end
  end
end
