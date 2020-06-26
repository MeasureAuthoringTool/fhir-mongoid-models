module FHIR
  # fhir/observation.rb
  class Observation < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Observation'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'ObservationStatus'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_many :focus, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :effectivedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :effectivePeriod, class_name: 'Period'
    embeds_one :effectiveTiming, class_name: 'Timing'
    embeds_one :effectiveinstant, class_name: 'PrimitiveInstant'
    embeds_one :issued, class_name: 'PrimitiveInstant'
    embeds_many :performer, class_name: 'Reference'
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
    embeds_many :note, class_name: 'Annotation'
    embeds_one :bodySite, class_name: 'CodeableConcept'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_one :specimen, class_name: 'Reference'
    embeds_one :device, class_name: 'Reference'
    embeds_many :referenceRange, class_name: 'ObservationReferenceRange'
    embeds_many :hasMember, class_name: 'Reference'
    embeds_many :derivedFrom, class_name: 'Reference'
    embeds_many :component, class_name: 'ObservationComponent'

    def self.transform_json(json_hash)
      result = Observation.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = ObservationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['focus'] = json_hash['focus'].map { |var| Reference.transform_json(var) } unless json_hash['focus'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['effectivedateTime'] = PrimitiveDateTime.transform_json(json_hash['effectivedateTime'], json_hash['_effectivedateTime']) unless json_hash['effectivedateTime'].nil?      
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?      
      result['effectiveTiming'] = Timing.transform_json(json_hash['effectiveTiming']) unless json_hash['effectiveTiming'].nil?      
      result['effectiveinstant'] = PrimitiveInstant.transform_json(json_hash['effectiveinstant'], json_hash['_effectiveinstant']) unless json_hash['effectiveinstant'].nil?      
      result['issued'] = PrimitiveInstant.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?      
      result['performer'] = json_hash['performer'].map { |var| Reference.transform_json(var) } unless json_hash['performer'].nil?
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
