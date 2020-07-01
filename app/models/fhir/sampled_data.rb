module FHIR
  # fhir/sampled_data.rb
  class SampledData < Element
    include Mongoid::Document
    embeds_one :origin, class_name: 'SimpleQuantity'
    embeds_one :period, class_name: 'PrimitiveDecimal'
    embeds_one :factor, class_name: 'PrimitiveDecimal'
    embeds_one :lowerLimit, class_name: 'PrimitiveDecimal'
    embeds_one :upperLimit, class_name: 'PrimitiveDecimal'
    embeds_one :dimensions, class_name: 'PrimitivePositiveInt'
    embeds_one :data, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = SampledData.new)
      result = self.superclass.transform_json(json_hash, target)
      result['origin'] = SimpleQuantity.transform_json(json_hash['origin']) unless json_hash['origin'].nil?      
      result['period'] = PrimitiveDecimal.transform_json(json_hash['period'], json_hash['_period']) unless json_hash['period'].nil?      
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?      
      result['lowerLimit'] = PrimitiveDecimal.transform_json(json_hash['lowerLimit'], json_hash['_lowerLimit']) unless json_hash['lowerLimit'].nil?      
      result['upperLimit'] = PrimitiveDecimal.transform_json(json_hash['upperLimit'], json_hash['_upperLimit']) unless json_hash['upperLimit'].nil?      
      result['dimensions'] = PrimitivePositiveInt.transform_json(json_hash['dimensions'], json_hash['_dimensions']) unless json_hash['dimensions'].nil?      
      result['data'] = PrimitiveString.transform_json(json_hash['data'], json_hash['_data']) unless json_hash['data'].nil?      

      result
    end
  end
end
