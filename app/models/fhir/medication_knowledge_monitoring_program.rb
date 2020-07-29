module FHIR
  # fhir/medication_knowledge_monitoring_program.rb
  class MedicationKnowledgeMonitoringProgram < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    

    def self.transform_json(json_hash, target = MedicationKnowledgeMonitoringProgram.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?

      result
    end
  end
end
