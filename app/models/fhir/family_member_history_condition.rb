module FHIR
  # fhir/family_member_history_condition.rb
  class FamilyMemberHistoryCondition < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'FamilyMemberHistoryCondition'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :outcome, class_name: 'CodeableConcept'
    embeds_one :contributedToDeath, class_name: 'PrimitiveBoolean'
    embeds_one :onsetAge, class_name: 'Age'
    embeds_one :onsetRange, class_name: 'Range'
    embeds_one :onsetPeriod, class_name: 'Period'
    embeds_one :onsetstring, class_name: 'PrimitiveString'
    embeds_many :note, class_name: 'Annotation'

    def self.transform_json(json_hash)
      result = FamilyMemberHistoryCondition.new
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['outcome'] = CodeableConcept.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?      
      result['contributedToDeath'] = PrimitiveBoolean.transform_json(json_hash['contributedToDeath'], json_hash['_contributedToDeath']) unless json_hash['contributedToDeath'].nil?      
      result['onsetAge'] = Age.transform_json(json_hash['onsetAge']) unless json_hash['onsetAge'].nil?      
      result['onsetRange'] = Range.transform_json(json_hash['onsetRange']) unless json_hash['onsetRange'].nil?      
      result['onsetPeriod'] = Period.transform_json(json_hash['onsetPeriod']) unless json_hash['onsetPeriod'].nil?      
      result['onsetstring'] = PrimitiveString.transform_json(json_hash['onsetstring'], json_hash['_onsetstring']) unless json_hash['onsetstring'].nil?      
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
