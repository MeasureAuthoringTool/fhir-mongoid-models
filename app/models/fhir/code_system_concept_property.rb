module FHIR
  # fhir/code_system_concept_property.rb
  class CodeSystemConceptProperty < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :valueCode, class_name: 'PrimitiveCode'
    embeds_one :valueCoding, class_name: 'Coding'
    embeds_one :valueString, class_name: 'PrimitiveString'
    embeds_one :valueInteger, class_name: 'PrimitiveInteger'
    embeds_one :valueBoolean, class_name: 'PrimitiveBoolean'
    embeds_one :valueDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :valueDecimal, class_name: 'PrimitiveDecimal'

    def self.transform_json(json_hash, target = CodeSystemConceptProperty.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['valueCode'] = PrimitiveCode.transform_json(json_hash['valueCode'], json_hash['_valueCode']) unless json_hash['valueCode'].nil?      
      result['valueCoding'] = Coding.transform_json(json_hash['valueCoding']) unless json_hash['valueCoding'].nil?      
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?      
      result['valueInteger'] = PrimitiveInteger.transform_json(json_hash['valueInteger'], json_hash['_valueInteger']) unless json_hash['valueInteger'].nil?      
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?      
      result['valueDateTime'] = PrimitiveDateTime.transform_json(json_hash['valueDateTime'], json_hash['_valueDateTime']) unless json_hash['valueDateTime'].nil?      
      result['valueDecimal'] = PrimitiveDecimal.transform_json(json_hash['valueDecimal'], json_hash['_valueDecimal']) unless json_hash['valueDecimal'].nil?      

      result
    end
  end
end
