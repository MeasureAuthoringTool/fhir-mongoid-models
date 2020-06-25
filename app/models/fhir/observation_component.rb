module FHIR
  # fhir/observation_component.rb
  class ObservationComponent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ObservationComponent'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :valuestring, class_name: 'PrimitiveString'
    embeds_one :valueboolean, class_name: 'PrimitiveBoolean'
    embeds_one :valueinteger, class_name: 'PrimitiveInteger'
    embeds_one :valueRange, class_name: 'Range'
    embeds_one :valueRatio, class_name: 'Ratio'
    embeds_one :valueSampledData, class_name: 'SampledData'
    embeds_one :valuetime, class_name: 'PrimitiveTime'
    embeds_one :valuedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :valuePeriod, class_name: 'Period'
    embeds_one :dataAbsentReason, class_name: 'CodeableConcept'
    embeds_many :interpretation, class_name: 'CodeableConcept'
    embeds_many :referenceRange, class_name: 'ObservationReferenceRange'

    def self.transform_json(json_hash)
      result = ObservationComponent.new
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?      
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?      
      result['valuestring'] = PrimitiveString.transform_json(json_hash['valuestring'], json_hash['_valuestring']) unless json_hash['valuestring'].nil?      
      result['valueboolean'] = PrimitiveBoolean.transform_json(json_hash['valueboolean'], json_hash['_valueboolean']) unless json_hash['valueboolean'].nil?      
      result['valueinteger'] = PrimitiveInteger.transform_json(json_hash['valueinteger'], json_hash['_valueinteger']) unless json_hash['valueinteger'].nil?      
      result['valueRange'] = Range.transform_json(json_hash['valueRange']) unless json_hash['valueRange'].nil?      
      result['valueRatio'] = Ratio.transform_json(json_hash['valueRatio']) unless json_hash['valueRatio'].nil?      
      result['valueSampledData'] = SampledData.transform_json(json_hash['valueSampledData']) unless json_hash['valueSampledData'].nil?      
      result['valuetime'] = PrimitiveTime.transform_json(json_hash['valuetime'], json_hash['_valuetime']) unless json_hash['valuetime'].nil?      
      result['valuedateTime'] = PrimitiveDateTime.transform_json(json_hash['valuedateTime'], json_hash['_valuedateTime']) unless json_hash['valuedateTime'].nil?      
      result['valuePeriod'] = Period.transform_json(json_hash['valuePeriod']) unless json_hash['valuePeriod'].nil?      
      result['dataAbsentReason'] = CodeableConcept.transform_json(json_hash['dataAbsentReason']) unless json_hash['dataAbsentReason'].nil?      
      result['interpretation'] = json_hash['interpretation'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['interpretation'].nil?
      result['referenceRange'] = json_hash['referenceRange'].map { |var| ObservationReferenceRange.transform_json(var) } unless json_hash['referenceRange'].nil?

      result
    end
  end
end
