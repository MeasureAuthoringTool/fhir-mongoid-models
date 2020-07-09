module FHIR
  # fhir/value_set_expansion_parameter.rb
  class ValueSetExpansionParameter < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :valueString, class_name: 'FHIR::PrimitiveString'
    embeds_one :valueBoolean, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :valueInteger, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :valueDecimal, class_name: 'FHIR::PrimitiveDecimal'
    embeds_one :valueUri, class_name: 'FHIR::PrimitiveUri'
    embeds_one :valueCode, class_name: 'FHIR::PrimitiveCode'
    embeds_one :valueDateTime, class_name: 'FHIR::PrimitiveDateTime'

    def self.transform_json(json_hash, target = ValueSetExpansionParameter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?      
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?      
      result['valueInteger'] = PrimitiveInteger.transform_json(json_hash['valueInteger'], json_hash['_valueInteger']) unless json_hash['valueInteger'].nil?      
      result['valueDecimal'] = PrimitiveDecimal.transform_json(json_hash['valueDecimal'], json_hash['_valueDecimal']) unless json_hash['valueDecimal'].nil?      
      result['valueUri'] = PrimitiveUri.transform_json(json_hash['valueUri'], json_hash['_valueUri']) unless json_hash['valueUri'].nil?      
      result['valueCode'] = PrimitiveCode.transform_json(json_hash['valueCode'], json_hash['_valueCode']) unless json_hash['valueCode'].nil?      
      result['valueDateTime'] = PrimitiveDateTime.transform_json(json_hash['valueDateTime'], json_hash['_valueDateTime']) unless json_hash['valueDateTime'].nil?      

      result
    end
  end
end
