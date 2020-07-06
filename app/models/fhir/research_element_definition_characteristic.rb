module FHIR
  # fhir/research_element_definition_characteristic.rb
  class ResearchElementDefinitionCharacteristic < BackboneElement
    include Mongoid::Document
    embeds_one :definitionCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :definitionCanonical, class_name: 'PrimitiveCanonical'
    embeds_one :definitionExpression, class_name: 'Expression'
    embeds_one :definitionDataRequirement, class_name: 'DataRequirement'
    embeds_many :usageContext, class_name: 'UsageContext'
    embeds_one :exclude, class_name: 'PrimitiveBoolean'
    embeds_one :unitOfMeasure, class_name: 'CodeableConcept'
    embeds_one :studyEffectiveDescription, class_name: 'PrimitiveString'
    embeds_one :studyEffectiveDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :studyEffectivePeriod, class_name: 'Period'
    embeds_one :studyEffectiveDuration, class_name: 'Duration'
    embeds_one :studyEffectiveTiming, class_name: 'Timing'
    embeds_one :studyEffectiveTimeFromStart, class_name: 'Duration'
    embeds_one :studyEffectiveGroupMeasure, class_name: 'GroupMeasure'
    embeds_one :participantEffectiveDescription, class_name: 'PrimitiveString'
    embeds_one :participantEffectiveDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :participantEffectivePeriod, class_name: 'Period'
    embeds_one :participantEffectiveDuration, class_name: 'Duration'
    embeds_one :participantEffectiveTiming, class_name: 'Timing'
    embeds_one :participantEffectiveTimeFromStart, class_name: 'Duration'
    embeds_one :participantEffectiveGroupMeasure, class_name: 'GroupMeasure'

    def self.transform_json(json_hash, target = ResearchElementDefinitionCharacteristic.new)
      result = self.superclass.transform_json(json_hash, target)
      result['definitionCodeableConcept'] = CodeableConcept.transform_json(json_hash['definitionCodeableConcept']) unless json_hash['definitionCodeableConcept'].nil?      
      result['definitionCanonical'] = PrimitiveCanonical.transform_json(json_hash['definitionCanonical'], json_hash['_definitionCanonical']) unless json_hash['definitionCanonical'].nil?      
      result['definitionExpression'] = Expression.transform_json(json_hash['definitionExpression']) unless json_hash['definitionExpression'].nil?      
      result['definitionDataRequirement'] = DataRequirement.transform_json(json_hash['definitionDataRequirement']) unless json_hash['definitionDataRequirement'].nil?      
      result['usageContext'] = json_hash['usageContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['usageContext'].nil?
      result['exclude'] = PrimitiveBoolean.transform_json(json_hash['exclude'], json_hash['_exclude']) unless json_hash['exclude'].nil?      
      result['unitOfMeasure'] = CodeableConcept.transform_json(json_hash['unitOfMeasure']) unless json_hash['unitOfMeasure'].nil?      
      result['studyEffectiveDescription'] = PrimitiveString.transform_json(json_hash['studyEffectiveDescription'], json_hash['_studyEffectiveDescription']) unless json_hash['studyEffectiveDescription'].nil?      
      result['studyEffectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['studyEffectiveDateTime'], json_hash['_studyEffectiveDateTime']) unless json_hash['studyEffectiveDateTime'].nil?      
      result['studyEffectivePeriod'] = Period.transform_json(json_hash['studyEffectivePeriod']) unless json_hash['studyEffectivePeriod'].nil?      
      result['studyEffectiveDuration'] = Duration.transform_json(json_hash['studyEffectiveDuration']) unless json_hash['studyEffectiveDuration'].nil?      
      result['studyEffectiveTiming'] = Timing.transform_json(json_hash['studyEffectiveTiming']) unless json_hash['studyEffectiveTiming'].nil?      
      result['studyEffectiveTimeFromStart'] = Duration.transform_json(json_hash['studyEffectiveTimeFromStart']) unless json_hash['studyEffectiveTimeFromStart'].nil?      
      result['studyEffectiveGroupMeasure'] = GroupMeasure.transform_json(json_hash['studyEffectiveGroupMeasure']) unless json_hash['studyEffectiveGroupMeasure'].nil?      
      result['participantEffectiveDescription'] = PrimitiveString.transform_json(json_hash['participantEffectiveDescription'], json_hash['_participantEffectiveDescription']) unless json_hash['participantEffectiveDescription'].nil?      
      result['participantEffectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['participantEffectiveDateTime'], json_hash['_participantEffectiveDateTime']) unless json_hash['participantEffectiveDateTime'].nil?      
      result['participantEffectivePeriod'] = Period.transform_json(json_hash['participantEffectivePeriod']) unless json_hash['participantEffectivePeriod'].nil?      
      result['participantEffectiveDuration'] = Duration.transform_json(json_hash['participantEffectiveDuration']) unless json_hash['participantEffectiveDuration'].nil?      
      result['participantEffectiveTiming'] = Timing.transform_json(json_hash['participantEffectiveTiming']) unless json_hash['participantEffectiveTiming'].nil?      
      result['participantEffectiveTimeFromStart'] = Duration.transform_json(json_hash['participantEffectiveTimeFromStart']) unless json_hash['participantEffectiveTimeFromStart'].nil?      
      result['participantEffectiveGroupMeasure'] = GroupMeasure.transform_json(json_hash['participantEffectiveGroupMeasure']) unless json_hash['participantEffectiveGroupMeasure'].nil?      

      result
    end
  end
end
