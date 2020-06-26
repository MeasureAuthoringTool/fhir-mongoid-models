module FHIR
  # fhir/medication_knowledge_monitoring_program.rb
  class MedicationKnowledgeMonitoringProgram < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeMonitoringProgram'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :name, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = MedicationKnowledgeMonitoringProgram.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      

      result
    end
  end
end
