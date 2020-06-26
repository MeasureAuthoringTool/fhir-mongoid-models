module FHIR
  # fhir/value_set_compose_include_concept_designation.rb
  class ValueSetComposeIncludeConceptDesignation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetComposeIncludeConceptDesignation'
    embeds_one :language, class_name: 'PrimitiveCode'
    embeds_one :use, class_name: 'Coding'
    embeds_one :value, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = ValueSetComposeIncludeConceptDesignation.new
      result['language'] = PrimitiveCode.transform_json(json_hash['language'], json_hash['_language']) unless json_hash['language'].nil?      
      result['use'] = Coding.transform_json(json_hash['use']) unless json_hash['use'].nil?      
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      

      result
    end
  end
end
