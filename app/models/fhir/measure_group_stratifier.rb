module FHIR
  # fhir/measure_group_stratifier.rb
  class MeasureGroupStratifier < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureGroupStratifier'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :criteria, class_name: 'Expression'
    embeds_many :component, class_name: 'MeasureGroupStratifierComponent'

    def self.transform_json(json_hash, target=MeasureGroupStratifier.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['criteria'] = Expression.transform_json(json_hash['criteria']) unless json_hash['criteria'].nil?      
      result['component'] = json_hash['component'].map { |var| MeasureGroupStratifierComponent.transform_json(var) } unless json_hash['component'].nil?

      result
    end
  end
end
