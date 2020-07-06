module FHIR
  # fhir/medication_knowledge_regulatory_schedule.rb
  class MedicationKnowledgeRegulatorySchedule < BackboneElement
    include Mongoid::Document
    embeds_one :schedule, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target = MedicationKnowledgeRegulatorySchedule.new)
      result = self.superclass.transform_json(json_hash, target)
      result['schedule'] = CodeableConcept.transform_json(json_hash['schedule']) unless json_hash['schedule'].nil?      

      result
    end
  end
end
