module FHIR
  # fhir/code_system_concept_property.rb
  class CodeSystemConceptProperty < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystemConceptProperty'
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :valuecode, class_name: 'PrimitiveCode'
    embeds_one :valueCoding, class_name: 'Coding'
    embeds_one :valuestring, class_name: 'PrimitiveString'
    embeds_one :valueinteger, class_name: 'PrimitiveInteger'
    embeds_one :valueboolean, class_name: 'PrimitiveBoolean'
    embeds_one :valuedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :valuedecimal, class_name: 'PrimitiveDecimal'

    def self.transform_json(json_hash)
      result = CodeSystemConceptProperty.new
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['valuecode'] = PrimitiveCode.transform_json(json_hash['valuecode'], json_hash['_valuecode']) unless json_hash['valuecode'].nil?      
      result['valueCoding'] = Coding.transform_json(json_hash['valueCoding']) unless json_hash['valueCoding'].nil?      
      result['valuestring'] = PrimitiveString.transform_json(json_hash['valuestring'], json_hash['_valuestring']) unless json_hash['valuestring'].nil?      
      result['valueinteger'] = PrimitiveInteger.transform_json(json_hash['valueinteger'], json_hash['_valueinteger']) unless json_hash['valueinteger'].nil?      
      result['valueboolean'] = PrimitiveBoolean.transform_json(json_hash['valueboolean'], json_hash['_valueboolean']) unless json_hash['valueboolean'].nil?      
      result['valuedateTime'] = PrimitiveDateTime.transform_json(json_hash['valuedateTime'], json_hash['_valuedateTime']) unless json_hash['valuedateTime'].nil?      
      result['valuedecimal'] = PrimitiveDecimal.transform_json(json_hash['valuedecimal'], json_hash['_valuedecimal']) unless json_hash['valuedecimal'].nil?      

      result
    end
  end
end
