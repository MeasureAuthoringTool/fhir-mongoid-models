module FHIR
  # fhir/observation_component.rb
  class ObservationComponent < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'
    embeds_one :valueQuantity, class_name: 'FHIR::Quantity'
    embeds_one :valueCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :valueString, class_name: 'FHIR::PrimitiveString'
    embeds_one :valueBoolean, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :valueInteger, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :valueRange, class_name: 'FHIR::Range'
    embeds_one :valueRatio, class_name: 'FHIR::Ratio'
    embeds_one :valueSampledData, class_name: 'FHIR::SampledData'
    embeds_one :valueTime, class_name: 'FHIR::PrimitiveTime'
    embeds_one :valueDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :valuePeriod, class_name: 'FHIR::Period'
    embeds_one :dataAbsentReason, class_name: 'FHIR::CodeableConcept'
    embeds_many :interpretation, class_name: 'FHIR::CodeableConcept'
    embeds_many :referenceRange, class_name: 'FHIR::ObservationReferenceRange'

    def self.transform_json(json_hash, target = ObservationComponent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?      
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?      
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?      
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?      
      result['valueInteger'] = PrimitiveInteger.transform_json(json_hash['valueInteger'], json_hash['_valueInteger']) unless json_hash['valueInteger'].nil?      
      result['valueRange'] = Range.transform_json(json_hash['valueRange']) unless json_hash['valueRange'].nil?      
      result['valueRatio'] = Ratio.transform_json(json_hash['valueRatio']) unless json_hash['valueRatio'].nil?      
      result['valueSampledData'] = SampledData.transform_json(json_hash['valueSampledData']) unless json_hash['valueSampledData'].nil?      
      result['valueTime'] = PrimitiveTime.transform_json(json_hash['valueTime'], json_hash['_valueTime']) unless json_hash['valueTime'].nil?      
      result['valueDateTime'] = PrimitiveDateTime.transform_json(json_hash['valueDateTime'], json_hash['_valueDateTime']) unless json_hash['valueDateTime'].nil?      
      result['valuePeriod'] = Period.transform_json(json_hash['valuePeriod']) unless json_hash['valuePeriod'].nil?      
      result['dataAbsentReason'] = CodeableConcept.transform_json(json_hash['dataAbsentReason']) unless json_hash['dataAbsentReason'].nil?      
      result['interpretation'] = json_hash['interpretation'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['interpretation'].nil?
      result['referenceRange'] = json_hash['referenceRange'].map { |var| ObservationReferenceRange.transform_json(var) } unless json_hash['referenceRange'].nil?

      result
    end
  end
end
