module FHIR
  # fhir/plan_definition_action.rb
  class PlanDefinitionAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PlanDefinitionAction'
    embeds_one :prefix, class_name: 'PrimitiveString'
    embeds_one :title, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :textEquivalent, class_name: 'PrimitiveString'
    embeds_one :priority, class_name: 'RequestPriority'
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_many :reason, class_name: 'CodeableConcept'
    embeds_many :documentation, class_name: 'RelatedArtifact'
    embeds_many :goalId, class_name: 'PrimitiveId'
    embeds_one :subjectCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :subjectReference, class_name: 'Reference'
    embeds_many :trigger, class_name: 'TriggerDefinition'
    embeds_many :condition, class_name: 'PlanDefinitionActionCondition'
    embeds_many :input, class_name: 'DataRequirement'
    embeds_many :output, class_name: 'DataRequirement'
    embeds_many :relatedAction, class_name: 'PlanDefinitionActionRelatedAction'
    embeds_one :timingdateTime, class_name: 'PrimitiveDateTime'
    embeds_one :timingAge, class_name: 'Age'
    embeds_one :timingPeriod, class_name: 'Period'
    embeds_one :timingDuration, class_name: 'Duration'
    embeds_one :timingRange, class_name: 'Range'
    embeds_one :timingTiming, class_name: 'Timing'
    embeds_many :participant, class_name: 'PlanDefinitionActionParticipant'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :groupingBehavior, class_name: 'ActionGroupingBehavior'
    embeds_one :selectionBehavior, class_name: 'ActionSelectionBehavior'
    embeds_one :requiredBehavior, class_name: 'ActionRequiredBehavior'
    embeds_one :precheckBehavior, class_name: 'ActionPrecheckBehavior'
    embeds_one :cardinalityBehavior, class_name: 'ActionCardinalityBehavior'
    embeds_one :definitioncanonical, class_name: 'PrimitiveCanonical'
    embeds_one :definitionuri, class_name: 'PrimitiveUri'
    embeds_one :transform, class_name: 'PrimitiveCanonical'
    embeds_many :dynamicValue, class_name: 'PlanDefinitionActionDynamicValue'
    embeds_many :action, class_name: 'PlanDefinitionAction'

    def self.transform_json(json_hash)
      result = PlanDefinitionAction.new
      result['prefix'] = PrimitiveString.transform_json(json_hash['prefix'], json_hash['_prefix']) unless json_hash['prefix'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['textEquivalent'] = PrimitiveString.transform_json(json_hash['textEquivalent'], json_hash['_textEquivalent']) unless json_hash['textEquivalent'].nil?      
      result['priority'] = RequestPriority.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['reason'] = json_hash['reason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reason'].nil?
      result['documentation'] = json_hash['documentation'].map { |var| RelatedArtifact.transform_json(var) } unless json_hash['documentation'].nil?
      result['goalId'] = json_hash['goalId'].each_with_index.map do |var, i|
        extension_hash = json_hash['_goalId'] && json_hash['_goalId'][i]
        PrimitiveId.transform_json(var, extension_hash)
      end unless json_hash['goalId'].nil?
      result['subjectCodeableConcept'] = CodeableConcept.transform_json(json_hash['subjectCodeableConcept']) unless json_hash['subjectCodeableConcept'].nil?      
      result['subjectReference'] = Reference.transform_json(json_hash['subjectReference']) unless json_hash['subjectReference'].nil?      
      result['trigger'] = json_hash['trigger'].map { |var| TriggerDefinition.transform_json(var) } unless json_hash['trigger'].nil?
      result['condition'] = json_hash['condition'].map { |var| PlanDefinitionActionCondition.transform_json(var) } unless json_hash['condition'].nil?
      result['input'] = json_hash['input'].map { |var| DataRequirement.transform_json(var) } unless json_hash['input'].nil?
      result['output'] = json_hash['output'].map { |var| DataRequirement.transform_json(var) } unless json_hash['output'].nil?
      result['relatedAction'] = json_hash['relatedAction'].map { |var| PlanDefinitionActionRelatedAction.transform_json(var) } unless json_hash['relatedAction'].nil?
      result['timingdateTime'] = PrimitiveDateTime.transform_json(json_hash['timingdateTime'], json_hash['_timingdateTime']) unless json_hash['timingdateTime'].nil?      
      result['timingAge'] = Age.transform_json(json_hash['timingAge']) unless json_hash['timingAge'].nil?      
      result['timingPeriod'] = Period.transform_json(json_hash['timingPeriod']) unless json_hash['timingPeriod'].nil?      
      result['timingDuration'] = Duration.transform_json(json_hash['timingDuration']) unless json_hash['timingDuration'].nil?      
      result['timingRange'] = Range.transform_json(json_hash['timingRange']) unless json_hash['timingRange'].nil?      
      result['timingTiming'] = Timing.transform_json(json_hash['timingTiming']) unless json_hash['timingTiming'].nil?      
      result['participant'] = json_hash['participant'].map { |var| PlanDefinitionActionParticipant.transform_json(var) } unless json_hash['participant'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['groupingBehavior'] = ActionGroupingBehavior.transform_json(json_hash['groupingBehavior']) unless json_hash['groupingBehavior'].nil?      
      result['selectionBehavior'] = ActionSelectionBehavior.transform_json(json_hash['selectionBehavior']) unless json_hash['selectionBehavior'].nil?      
      result['requiredBehavior'] = ActionRequiredBehavior.transform_json(json_hash['requiredBehavior']) unless json_hash['requiredBehavior'].nil?      
      result['precheckBehavior'] = ActionPrecheckBehavior.transform_json(json_hash['precheckBehavior']) unless json_hash['precheckBehavior'].nil?      
      result['cardinalityBehavior'] = ActionCardinalityBehavior.transform_json(json_hash['cardinalityBehavior']) unless json_hash['cardinalityBehavior'].nil?      
      result['definitioncanonical'] = PrimitiveCanonical.transform_json(json_hash['definitioncanonical'], json_hash['_definitioncanonical']) unless json_hash['definitioncanonical'].nil?      
      result['definitionuri'] = PrimitiveUri.transform_json(json_hash['definitionuri'], json_hash['_definitionuri']) unless json_hash['definitionuri'].nil?      
      result['transform'] = PrimitiveCanonical.transform_json(json_hash['transform'], json_hash['_transform']) unless json_hash['transform'].nil?      
      result['dynamicValue'] = json_hash['dynamicValue'].map { |var| PlanDefinitionActionDynamicValue.transform_json(var) } unless json_hash['dynamicValue'].nil?
      result['action'] = json_hash['action'].map { |var| PlanDefinitionAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
