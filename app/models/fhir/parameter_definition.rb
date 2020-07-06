module FHIR
  # fhir/parameter_definition.rb
  class ParameterDefinition < Element
    include Mongoid::Document
    embeds_one :name, class_name: 'PrimitiveCode'
    embeds_one :use, class_name: 'ParameterUse'
    embeds_one :min, class_name: 'PrimitiveInteger'
    embeds_one :max, class_name: 'PrimitiveString'
    embeds_one :documentation, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'FHIRAllTypes'
    embeds_one :profile, class_name: 'PrimitiveCanonical'

    def self.transform_json(json_hash, target = ParameterDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveCode.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['use'] = ParameterUse.transform_json(json_hash['use']) unless json_hash['use'].nil?      
      result['min'] = PrimitiveInteger.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?      
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?      
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      
      result['type'] = FHIRAllTypes.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?      

      result
    end
  end
end
