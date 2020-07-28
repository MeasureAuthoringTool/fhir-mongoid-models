module FHIR
  # fhir/family_member_history_condition.rb
  class FamilyMemberHistoryCondition < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :outcome, class_name: 'FHIR::CodeableConcept'    
    embeds_one :contributedToDeath, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :onsetAge, class_name: 'FHIR::Age'    
    embeds_one :onsetRange, class_name: 'FHIR::Range'    
    embeds_one :onsetPeriod, class_name: 'FHIR::Period'    
    embeds_one :onsetString, class_name: 'FHIR::PrimitiveString'    
    embeds_many :note, class_name: 'FHIR::Annotation'    

    def self.transform_json(json_hash, target = FamilyMemberHistoryCondition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['outcome'] = CodeableConcept.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?
      result['contributedToDeath'] = PrimitiveBoolean.transform_json(json_hash['contributedToDeath'], json_hash['_contributedToDeath']) unless json_hash['contributedToDeath'].nil?
      result['onsetAge'] = Age.transform_json(json_hash['onsetAge']) unless json_hash['onsetAge'].nil?
      result['onsetRange'] = Range.transform_json(json_hash['onsetRange']) unless json_hash['onsetRange'].nil?
      result['onsetPeriod'] = Period.transform_json(json_hash['onsetPeriod']) unless json_hash['onsetPeriod'].nil?
      result['onsetString'] = PrimitiveString.transform_json(json_hash['onsetString'], json_hash['_onsetString']) unless json_hash['onsetString'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
