module FHIR
  # fhir/code_system_filter.rb
  class CodeSystemFilter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystemFilter'
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_many :operator, class_name: 'FilterOperator'
    embeds_one :value, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=CodeSystemFilter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['operator'] = json_hash['operator'].map { |var| FilterOperator.transform_json(var) } unless json_hash['operator'].nil?
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      

      result
    end
  end
end
