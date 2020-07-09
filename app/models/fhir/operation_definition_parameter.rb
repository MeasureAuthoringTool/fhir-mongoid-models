module FHIR
  # fhir/operation_definition_parameter.rb
  class OperationDefinitionParameter < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveCode'
    embeds_one :use, class_name: 'FHIR::OperationParameterUse'
    embeds_one :min, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :max, class_name: 'FHIR::PrimitiveString'
    embeds_one :documentation, class_name: 'FHIR::PrimitiveString'
    embeds_one :type, class_name: 'FHIR::FHIRAllTypes'
    embeds_many :targetProfile, class_name: 'FHIR::PrimitiveCanonical'
    embeds_one :searchType, class_name: 'FHIR::SearchParamType'
    embeds_one :binding, class_name: 'FHIR::OperationDefinitionParameterBinding'
    embeds_many :referencedFrom, class_name: 'FHIR::OperationDefinitionParameterReferencedFrom'
    embeds_many :part, class_name: 'FHIR::OperationDefinitionParameter'

    def self.transform_json(json_hash, target = OperationDefinitionParameter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveCode.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['use'] = OperationParameterUse.transform_json(json_hash['use']) unless json_hash['use'].nil?      
      result['min'] = PrimitiveInteger.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?      
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?      
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      
      result['type'] = FHIRAllTypes.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['targetProfile'] = json_hash['targetProfile'].each_with_index.map do |var, i|
        extension_hash = json_hash['_targetProfile'] && json_hash['_targetProfile'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['targetProfile'].nil?
      result['searchType'] = SearchParamType.transform_json(json_hash['searchType']) unless json_hash['searchType'].nil?      
      result['binding'] = OperationDefinitionParameterBinding.transform_json(json_hash['binding']) unless json_hash['binding'].nil?      
      result['referencedFrom'] = json_hash['referencedFrom'].map { |var| OperationDefinitionParameterReferencedFrom.transform_json(var) } unless json_hash['referencedFrom'].nil?
      result['part'] = json_hash['part'].map { |var| OperationDefinitionParameter.transform_json(var) } unless json_hash['part'].nil?

      result
    end
  end
end
