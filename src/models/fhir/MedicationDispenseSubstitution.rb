module FHIR
  class MedicationDispenseSubstitution < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationDispenseSubstitution'
    field :wasSubstituted, type:  # primitive
    embeds_one :_wasSubstituted, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :reason, class_name: 'CodeableConcept'
    embeds_many :responsibleParty, class_name: 'Reference'
  end
end
