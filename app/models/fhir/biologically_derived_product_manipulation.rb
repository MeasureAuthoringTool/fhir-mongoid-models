module FHIR
  # fhir/biologically_derived_product_manipulation.rb
  class BiologicallyDerivedProductManipulation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductManipulation'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :timedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :timePeriod, class_name: 'Period'

    def self.transform_json(json_hash)
      result = BiologicallyDerivedProductManipulation.new
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['timedateTime'] = PrimitiveDateTime.transform_json(json_hash['timedateTime'], json_hash['_timedateTime']) unless json_hash['timedateTime'].nil?      
      result['timePeriod'] = Period.transform_json(json_hash['timePeriod']) unless json_hash['timePeriod'].nil?      

      result
    end
  end
end
