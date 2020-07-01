module FHIR
  # fhir/graph_definition_link_target_compartment.rb
  class GraphDefinitionLinkTargetCompartment < BackboneElement
    include Mongoid::Document
    embeds_one :use, class_name: 'GraphCompartmentUse'
    embeds_one :code, class_name: 'CompartmentCode'
    embeds_one :rule, class_name: 'GraphCompartmentRule'
    embeds_one :expression, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = GraphDefinitionLinkTargetCompartment.new)
      result = self.superclass.transform_json(json_hash, target)
      result['use'] = GraphCompartmentUse.transform_json(json_hash['use']) unless json_hash['use'].nil?      
      result['code'] = CompartmentCode.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['rule'] = GraphCompartmentRule.transform_json(json_hash['rule']) unless json_hash['rule'].nil?      
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      

      result
    end
  end
end
