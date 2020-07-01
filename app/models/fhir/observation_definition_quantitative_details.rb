module FHIR
  # fhir/observation_definition_quantitative_details.rb
  class ObservationDefinitionQuantitativeDetails < BackboneElement
    include Mongoid::Document
    embeds_one :customaryUnit, class_name: 'CodeableConcept'
    embeds_one :unit, class_name: 'CodeableConcept'
    embeds_one :conversionFactor, class_name: 'PrimitiveDecimal'
    embeds_one :decimalPrecision, class_name: 'PrimitiveInteger'

    def self.transform_json(json_hash, target = ObservationDefinitionQuantitativeDetails.new)
      result = self.superclass.transform_json(json_hash, target)
      result['customaryUnit'] = CodeableConcept.transform_json(json_hash['customaryUnit']) unless json_hash['customaryUnit'].nil?      
      result['unit'] = CodeableConcept.transform_json(json_hash['unit']) unless json_hash['unit'].nil?      
      result['conversionFactor'] = PrimitiveDecimal.transform_json(json_hash['conversionFactor'], json_hash['_conversionFactor']) unless json_hash['conversionFactor'].nil?      
      result['decimalPrecision'] = PrimitiveInteger.transform_json(json_hash['decimalPrecision'], json_hash['_decimalPrecision']) unless json_hash['decimalPrecision'].nil?      

      result
    end
  end
end
