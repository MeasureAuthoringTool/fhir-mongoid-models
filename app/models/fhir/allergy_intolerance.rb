module FHIR
  # fhir/allergy_intolerance.rb
  class AllergyIntolerance < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :clinicalStatus, class_name: 'CodeableConcept'
    embeds_one :verificationStatus, class_name: 'CodeableConcept'
    embeds_one :type, class_name: 'AllergyIntoleranceType'
    embeds_many :category, class_name: 'AllergyIntoleranceCategory'
    embeds_one :criticality, class_name: 'AllergyIntoleranceCriticality'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :onsetDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :onsetAge, class_name: 'Age'
    embeds_one :onsetPeriod, class_name: 'Period'
    embeds_one :onsetRange, class_name: 'Range'
    embeds_one :onsetString, class_name: 'PrimitiveString'
    embeds_one :recordedDate, class_name: 'PrimitiveDateTime'
    embeds_one :recorder, class_name: 'Reference'
    embeds_one :asserter, class_name: 'Reference'
    embeds_one :lastOccurrence, class_name: 'PrimitiveDateTime'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :reaction, class_name: 'AllergyIntoleranceReaction'

    def self.transform_json(json_hash, target = AllergyIntolerance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['clinicalStatus'] = CodeableConcept.transform_json(json_hash['clinicalStatus']) unless json_hash['clinicalStatus'].nil?      
      result['verificationStatus'] = CodeableConcept.transform_json(json_hash['verificationStatus']) unless json_hash['verificationStatus'].nil?      
      result['type'] = AllergyIntoleranceType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['category'] = json_hash['category'].map { |var| AllergyIntoleranceCategory.transform_json(var) } unless json_hash['category'].nil?
      result['criticality'] = AllergyIntoleranceCriticality.transform_json(json_hash['criticality']) unless json_hash['criticality'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['onsetDateTime'] = PrimitiveDateTime.transform_json(json_hash['onsetDateTime'], json_hash['_onsetDateTime']) unless json_hash['onsetDateTime'].nil?      
      result['onsetAge'] = Age.transform_json(json_hash['onsetAge']) unless json_hash['onsetAge'].nil?      
      result['onsetPeriod'] = Period.transform_json(json_hash['onsetPeriod']) unless json_hash['onsetPeriod'].nil?      
      result['onsetRange'] = Range.transform_json(json_hash['onsetRange']) unless json_hash['onsetRange'].nil?      
      result['onsetString'] = PrimitiveString.transform_json(json_hash['onsetString'], json_hash['_onsetString']) unless json_hash['onsetString'].nil?      
      result['recordedDate'] = PrimitiveDateTime.transform_json(json_hash['recordedDate'], json_hash['_recordedDate']) unless json_hash['recordedDate'].nil?      
      result['recorder'] = Reference.transform_json(json_hash['recorder']) unless json_hash['recorder'].nil?      
      result['asserter'] = Reference.transform_json(json_hash['asserter']) unless json_hash['asserter'].nil?      
      result['lastOccurrence'] = PrimitiveDateTime.transform_json(json_hash['lastOccurrence'], json_hash['_lastOccurrence']) unless json_hash['lastOccurrence'].nil?      
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['reaction'] = json_hash['reaction'].map { |var| AllergyIntoleranceReaction.transform_json(var) } unless json_hash['reaction'].nil?

      result
    end
  end
end
