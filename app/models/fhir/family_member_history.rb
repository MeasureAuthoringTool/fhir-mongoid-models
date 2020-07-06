module FHIR
  # fhir/family_member_history.rb
  class FamilyMemberHistory < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :instantiatesCanonical, class_name: 'PrimitiveCanonical'
    embeds_many :instantiatesUri, class_name: 'PrimitiveUri'
    embeds_one :status, class_name: 'FamilyHistoryStatus'
    embeds_one :dataAbsentReason, class_name: 'CodeableConcept'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :relationship, class_name: 'CodeableConcept'
    embeds_one :sex, class_name: 'CodeableConcept'
    embeds_one :bornPeriod, class_name: 'Period'
    embeds_one :bornDate, class_name: 'PrimitiveDate'
    embeds_one :bornString, class_name: 'PrimitiveString'
    embeds_one :ageAge, class_name: 'Age'
    embeds_one :ageRange, class_name: 'Range'
    embeds_one :ageString, class_name: 'PrimitiveString'
    embeds_one :estimatedAge, class_name: 'PrimitiveBoolean'
    embeds_one :deceasedBoolean, class_name: 'PrimitiveBoolean'
    embeds_one :deceasedAge, class_name: 'Age'
    embeds_one :deceasedRange, class_name: 'Range'
    embeds_one :deceasedDate, class_name: 'PrimitiveDate'
    embeds_one :deceasedString, class_name: 'PrimitiveString'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :condition, class_name: 'FamilyMemberHistoryCondition'

    def self.transform_json(json_hash, target = FamilyMemberHistory.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['instantiatesCanonical'] = json_hash['instantiatesCanonical'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesCanonical'] && json_hash['_instantiatesCanonical'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['instantiatesCanonical'].nil?
      result['instantiatesUri'] = json_hash['instantiatesUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesUri'] && json_hash['_instantiatesUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiatesUri'].nil?
      result['status'] = FamilyHistoryStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['dataAbsentReason'] = CodeableConcept.transform_json(json_hash['dataAbsentReason']) unless json_hash['dataAbsentReason'].nil?      
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['relationship'] = CodeableConcept.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?      
      result['sex'] = CodeableConcept.transform_json(json_hash['sex']) unless json_hash['sex'].nil?      
      result['bornPeriod'] = Period.transform_json(json_hash['bornPeriod']) unless json_hash['bornPeriod'].nil?      
      result['bornDate'] = PrimitiveDate.transform_json(json_hash['bornDate'], json_hash['_bornDate']) unless json_hash['bornDate'].nil?      
      result['bornString'] = PrimitiveString.transform_json(json_hash['bornString'], json_hash['_bornString']) unless json_hash['bornString'].nil?      
      result['ageAge'] = Age.transform_json(json_hash['ageAge']) unless json_hash['ageAge'].nil?      
      result['ageRange'] = Range.transform_json(json_hash['ageRange']) unless json_hash['ageRange'].nil?      
      result['ageString'] = PrimitiveString.transform_json(json_hash['ageString'], json_hash['_ageString']) unless json_hash['ageString'].nil?      
      result['estimatedAge'] = PrimitiveBoolean.transform_json(json_hash['estimatedAge'], json_hash['_estimatedAge']) unless json_hash['estimatedAge'].nil?      
      result['deceasedBoolean'] = PrimitiveBoolean.transform_json(json_hash['deceasedBoolean'], json_hash['_deceasedBoolean']) unless json_hash['deceasedBoolean'].nil?      
      result['deceasedAge'] = Age.transform_json(json_hash['deceasedAge']) unless json_hash['deceasedAge'].nil?      
      result['deceasedRange'] = Range.transform_json(json_hash['deceasedRange']) unless json_hash['deceasedRange'].nil?      
      result['deceasedDate'] = PrimitiveDate.transform_json(json_hash['deceasedDate'], json_hash['_deceasedDate']) unless json_hash['deceasedDate'].nil?      
      result['deceasedString'] = PrimitiveString.transform_json(json_hash['deceasedString'], json_hash['_deceasedString']) unless json_hash['deceasedString'].nil?      
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['condition'] = json_hash['condition'].map { |var| FamilyMemberHistoryCondition.transform_json(var) } unless json_hash['condition'].nil?

      result
    end
  end
end
