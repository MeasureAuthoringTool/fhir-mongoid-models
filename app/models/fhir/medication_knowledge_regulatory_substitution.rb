module FHIR
  # fhir/medication_knowledge_regulatory_substitution.rb
  class MedicationKnowledgeRegulatorySubstitution < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :allowed, class_name: 'FHIR::PrimitiveBoolean'

    def self.transform_json(json_hash, target = MedicationKnowledgeRegulatorySubstitution.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['allowed'] = PrimitiveBoolean.transform_json(json_hash['allowed'], json_hash['_allowed']) unless json_hash['allowed'].nil?      

      result
    end
  end
end
