module FHIR
  # fhir/operation_definition_overload.rb
  class OperationDefinitionOverload < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationDefinitionOverload'
    embeds_many :parameterName, class_name: 'PrimitiveString'
    embeds_one :comment, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = OperationDefinitionOverload.new
      result['parameterName'] = json_hash['parameterName'].each_with_index.map do |var, i|
        extension_hash = json_hash['_parameterName'] && json_hash['_parameterName'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['parameterName'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      

      result
    end
  end
end
