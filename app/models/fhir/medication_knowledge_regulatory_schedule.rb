module FHIR
  # fhir/medication_knowledge_regulatory_schedule.rb
  class MedicationKnowledgeRegulatorySchedule < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeRegulatorySchedule'
    embeds_one :schedule, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = MedicationKnowledgeRegulatorySchedule.new
      result['schedule'] = CodeableConcept.transform_json(json_hash['schedule']) unless json_hash['schedule'].nil?      

      result
    end
  end
end
