module FHIR
  # fhir/biologically_derived_product_manipulation.rb
  class BiologicallyDerivedProductManipulation < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :timeDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :timePeriod, class_name: 'FHIR::Period'    

    def self.transform_json(json_hash, target = BiologicallyDerivedProductManipulation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['timeDateTime'] = PrimitiveDateTime.transform_json(json_hash['timeDateTime'], json_hash['_timeDateTime']) unless json_hash['timeDateTime'].nil?
      result['timePeriod'] = Period.transform_json(json_hash['timePeriod']) unless json_hash['timePeriod'].nil?

      result
    end
  end
end
