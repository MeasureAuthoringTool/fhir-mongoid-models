module FHIR
  # fhir/measure_group_population.rb
  class MeasureGroupPopulation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureGroupPopulation'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :criteria, class_name: 'Expression'

    def self.transform_json(json_hash, target=MeasureGroupPopulation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['criteria'] = Expression.transform_json(json_hash['criteria']) unless json_hash['criteria'].nil?      

      result
    end
  end
end
