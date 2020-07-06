module FHIR
  # fhir/observation.rb
  class Observation < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'ObservationStatus'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_many :focus, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :effectiveDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :effectivePeriod, class_name: 'Period'
    embeds_one :effectiveTiming, class_name: 'Timing'
    embeds_one :effectiveInstant, class_name: 'PrimitiveInstant'
    embeds_one :issued, class_name: 'PrimitiveInstant'
    embeds_many :performer, class_name: 'Reference'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :valueString, class_name: 'PrimitiveString'
    embeds_one :valueBoolean, class_name: 'PrimitiveBoolean'
    embeds_one :valueInteger, class_name: 'PrimitiveInteger'
    embeds_one :valueRange, class_name: 'Range'
    embeds_one :valueRatio, class_name: 'Ratio'
    embeds_one :valueSampledData, class_name: 'SampledData'
    embeds_one :valueTime, class_name: 'PrimitiveTime'
    embeds_one :valueDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :valuePeriod, class_name: 'Period'
    embeds_one :dataAbsentReason, class_name: 'CodeableConcept'
    embeds_many :interpretation, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
    embeds_one :bodySite, class_name: 'CodeableConcept'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_one :specimen, class_name: 'Reference'
    embeds_one :device, class_name: 'Reference'
    embeds_many :referenceRange, class_name: 'ObservationReferenceRange'
    embeds_many :hasMember, class_name: 'Reference'
    embeds_many :derivedFrom, class_name: 'Reference'
    embeds_many :component, class_name: 'ObservationComponent'

    def self.transform_json(json_hash, target = Observation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = ObservationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['focus'] = json_hash['focus'].map { |var| Reference.transform_json(var) } unless json_hash['focus'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['effectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['effectiveDateTime'], json_hash['_effectiveDateTime']) unless json_hash['effectiveDateTime'].nil?      
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?      
      result['effectiveTiming'] = Timing.transform_json(json_hash['effectiveTiming']) unless json_hash['effectiveTiming'].nil?      
      result['effectiveInstant'] = PrimitiveInstant.transform_json(json_hash['effectiveInstant'], json_hash['_effectiveInstant']) unless json_hash['effectiveInstant'].nil?      
      result['issued'] = PrimitiveInstant.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?      
      result['performer'] = json_hash['performer'].map { |var| Reference.transform_json(var) } unless json_hash['performer'].nil?
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
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['bodySite'] = CodeableConcept.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?      
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?      
      result['specimen'] = Reference.transform_json(json_hash['specimen']) unless json_hash['specimen'].nil?      
      result['device'] = Reference.transform_json(json_hash['device']) unless json_hash['device'].nil?      
      result['referenceRange'] = json_hash['referenceRange'].map { |var| ObservationReferenceRange.transform_json(var) } unless json_hash['referenceRange'].nil?
      result['hasMember'] = json_hash['hasMember'].map { |var| Reference.transform_json(var) } unless json_hash['hasMember'].nil?
      result['derivedFrom'] = json_hash['derivedFrom'].map { |var| Reference.transform_json(var) } unless json_hash['derivedFrom'].nil?
      result['component'] = json_hash['component'].map { |var| ObservationComponent.transform_json(var) } unless json_hash['component'].nil?

      result
    end
  end
end
