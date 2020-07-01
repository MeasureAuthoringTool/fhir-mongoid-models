module FHIR
  # fhir/measure_supplemental_data.rb
  class MeasureSupplementalData < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :usage, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :criteria, class_name: 'Expression'

    def self.transform_json(json_hash, target = MeasureSupplementalData.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['usage'] = json_hash['usage'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['usage'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['criteria'] = Expression.transform_json(json_hash['criteria']) unless json_hash['criteria'].nil?      

      result
    end
  end
end
