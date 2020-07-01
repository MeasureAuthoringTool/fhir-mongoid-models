module FHIR
  # fhir/coverage_class.rb
  class CoverageClass < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :value, class_name: 'PrimitiveString'
    embeds_one :name, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = CoverageClass.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      

      result
    end
  end
end
