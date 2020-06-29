module FHIR
  # fhir/code_system_concept_designation.rb
  class CodeSystemConceptDesignation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystemConceptDesignation'
    embeds_one :language, class_name: 'PrimitiveCode'
    embeds_one :use, class_name: 'Coding'
    embeds_one :value, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=CodeSystemConceptDesignation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['language'] = PrimitiveCode.transform_json(json_hash['language'], json_hash['_language']) unless json_hash['language'].nil?      
      result['use'] = Coding.transform_json(json_hash['use']) unless json_hash['use'].nil?      
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      

      result
    end
  end
end
