module FHIR
  # fhir/plan_definition_goal.rb
  class PlanDefinitionGoal < BackboneElement
    include Mongoid::Document
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::CodeableConcept'    
    embeds_one :priority, class_name: 'FHIR::CodeableConcept'    
    embeds_one :start, class_name: 'FHIR::CodeableConcept'    
    embeds_many :addresses, class_name: 'FHIR::CodeableConcept'    
    embeds_many :documentation, class_name: 'FHIR::RelatedArtifact'    
    embeds_many :target, class_name: 'FHIR::PlanDefinitionGoalTarget'    

    def self.transform_json(json_hash, target = PlanDefinitionGoal.new)
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['description'] = CodeableConcept.transform_json(json_hash['description']) unless json_hash['description'].nil?
      result['priority'] = CodeableConcept.transform_json(json_hash['priority']) unless json_hash['priority'].nil?
      result['start'] = CodeableConcept.transform_json(json_hash['start']) unless json_hash['start'].nil?
      result['addresses'] = json_hash['addresses'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['addresses'].nil?
      result['documentation'] = json_hash['documentation'].map { |var| RelatedArtifact.transform_json(var) } unless json_hash['documentation'].nil?
      result['target'] = json_hash['target'].map { |var| PlanDefinitionGoalTarget.transform_json(var) } unless json_hash['target'].nil?

      result
    end
  end
end
