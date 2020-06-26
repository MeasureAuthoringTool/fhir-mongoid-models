module FHIR
  # fhir/measure_group.rb
  class MeasureGroup < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureGroup'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_many :population, class_name: 'MeasureGroupPopulation'
    embeds_many :stratifier, class_name: 'MeasureGroupStratifier'

    def self.transform_json(json_hash)
      result = MeasureGroup.new
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['population'] = json_hash['population'].map { |var| MeasureGroupPopulation.transform_json(var) } unless json_hash['population'].nil?
      result['stratifier'] = json_hash['stratifier'].map { |var| MeasureGroupStratifier.transform_json(var) } unless json_hash['stratifier'].nil?

      result
    end
  end
end
