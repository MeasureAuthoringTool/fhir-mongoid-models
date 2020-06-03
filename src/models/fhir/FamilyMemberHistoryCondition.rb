module FHIR
  class FamilyMemberHistoryCondition < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'FamilyMemberHistoryCondition'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :outcome, class_name: 'CodeableConcept'
    field :contributedToDeath, type:  # primitive
    embeds_one :_contributedToDeath, class_name: 'Extension'
    embeds_one :onsetAge, class_name: 'Age'
    embeds_one :onsetRange, class_name: 'Range'
    embeds_one :onsetPeriod, class_name: 'Period'
    field :onsetPrimitiveString, type:  # primitive
    embeds_one :_onsetPrimitiveString, class_name: 'Extension'
    embeds_many :note, class_name: 'Annotation'
  end
end
