module FHIR
  # fhir/value_set_expansion_parameter.rb
  class ValueSetExpansionParameter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetExpansionParameter'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :valuestring, class_name: 'PrimitiveString'
    embeds_one :valueboolean, class_name: 'PrimitiveBoolean'
    embeds_one :valueinteger, class_name: 'PrimitiveInteger'
    embeds_one :valuedecimal, class_name: 'PrimitiveDecimal'
    embeds_one :valueuri, class_name: 'PrimitiveUri'
    embeds_one :valuecode, class_name: 'PrimitiveCode'
    embeds_one :valuedateTime, class_name: 'PrimitiveDateTime'

    def self.transform_json(json_hash)
      result = ValueSetExpansionParameter.new
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['valuestring'] = PrimitiveString.transform_json(json_hash['valuestring'], json_hash['_valuestring']) unless json_hash['valuestring'].nil?      
      result['valueboolean'] = PrimitiveBoolean.transform_json(json_hash['valueboolean'], json_hash['_valueboolean']) unless json_hash['valueboolean'].nil?      
      result['valueinteger'] = PrimitiveInteger.transform_json(json_hash['valueinteger'], json_hash['_valueinteger']) unless json_hash['valueinteger'].nil?      
      result['valuedecimal'] = PrimitiveDecimal.transform_json(json_hash['valuedecimal'], json_hash['_valuedecimal']) unless json_hash['valuedecimal'].nil?      
      result['valueuri'] = PrimitiveUri.transform_json(json_hash['valueuri'], json_hash['_valueuri']) unless json_hash['valueuri'].nil?      
      result['valuecode'] = PrimitiveCode.transform_json(json_hash['valuecode'], json_hash['_valuecode']) unless json_hash['valuecode'].nil?      
      result['valuedateTime'] = PrimitiveDateTime.transform_json(json_hash['valuedateTime'], json_hash['_valuedateTime']) unless json_hash['valuedateTime'].nil?      

      result
    end
  end
end
