module FHIR
  # fhir/medication_dispense_substitution.rb
  class MedicationDispenseSubstitution < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationDispenseSubstitution'
    embeds_one :wasSubstituted, class_name: 'PrimitiveBoolean'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :reason, class_name: 'CodeableConcept'
    embeds_many :responsibleParty, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = MedicationDispenseSubstitution.new
      result['wasSubstituted'] = PrimitiveBoolean.transform_json(json_hash['wasSubstituted'], json_hash['_wasSubstituted']) unless json_hash['wasSubstituted'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['reason'] = json_hash['reason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reason'].nil?
      result['responsibleParty'] = json_hash['responsibleParty'].map { |var| Reference.transform_json(var) } unless json_hash['responsibleParty'].nil?

      result
    end
  end
end
