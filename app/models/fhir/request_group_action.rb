module FHIR
  # fhir/request_group_action.rb
  class RequestGroupAction < BackboneElement
    include Mongoid::Document
    embeds_one :prefix, class_name: 'FHIR::PrimitiveString'
    embeds_one :title, class_name: 'FHIR::PrimitiveString'
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_one :textEquivalent, class_name: 'FHIR::PrimitiveString'
    embeds_one :priority, class_name: 'FHIR::RequestPriority'
    embeds_many :code, class_name: 'FHIR::CodeableConcept'
    embeds_many :documentation, class_name: 'FHIR::RelatedArtifact'
    embeds_many :condition, class_name: 'FHIR::RequestGroupActionCondition'
    embeds_many :relatedAction, class_name: 'FHIR::RequestGroupActionRelatedAction'
    embeds_one :timingDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :timingAge, class_name: 'FHIR::Age'
    embeds_one :timingPeriod, class_name: 'FHIR::Period'
    embeds_one :timingDuration, class_name: 'FHIR::Duration'
    embeds_one :timingRange, class_name: 'FHIR::Range'
    embeds_one :timingTiming, class_name: 'FHIR::Timing'
    embeds_many :participant, class_name: 'FHIR::Reference'
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :groupingBehavior, class_name: 'FHIR::ActionGroupingBehavior'
    embeds_one :selectionBehavior, class_name: 'FHIR::ActionSelectionBehavior'
    embeds_one :requiredBehavior, class_name: 'FHIR::ActionRequiredBehavior'
    embeds_one :precheckBehavior, class_name: 'FHIR::ActionPrecheckBehavior'
    embeds_one :cardinalityBehavior, class_name: 'FHIR::ActionCardinalityBehavior'
    embeds_one :resource, class_name: 'FHIR::Reference'
    embeds_many :action, class_name: 'FHIR::RequestGroupAction'

    def self.transform_json(json_hash, target = RequestGroupAction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['prefix'] = PrimitiveString.transform_json(json_hash['prefix'], json_hash['_prefix']) unless json_hash['prefix'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['textEquivalent'] = PrimitiveString.transform_json(json_hash['textEquivalent'], json_hash['_textEquivalent']) unless json_hash['textEquivalent'].nil?      
      result['priority'] = RequestPriority.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['documentation'] = json_hash['documentation'].map { |var| RelatedArtifact.transform_json(var) } unless json_hash['documentation'].nil?
      result['condition'] = json_hash['condition'].map { |var| RequestGroupActionCondition.transform_json(var) } unless json_hash['condition'].nil?
      result['relatedAction'] = json_hash['relatedAction'].map { |var| RequestGroupActionRelatedAction.transform_json(var) } unless json_hash['relatedAction'].nil?
      result['timingDateTime'] = PrimitiveDateTime.transform_json(json_hash['timingDateTime'], json_hash['_timingDateTime']) unless json_hash['timingDateTime'].nil?      
      result['timingAge'] = Age.transform_json(json_hash['timingAge']) unless json_hash['timingAge'].nil?      
      result['timingPeriod'] = Period.transform_json(json_hash['timingPeriod']) unless json_hash['timingPeriod'].nil?      
      result['timingDuration'] = Duration.transform_json(json_hash['timingDuration']) unless json_hash['timingDuration'].nil?      
      result['timingRange'] = Range.transform_json(json_hash['timingRange']) unless json_hash['timingRange'].nil?      
      result['timingTiming'] = Timing.transform_json(json_hash['timingTiming']) unless json_hash['timingTiming'].nil?      
      result['participant'] = json_hash['participant'].map { |var| Reference.transform_json(var) } unless json_hash['participant'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['groupingBehavior'] = ActionGroupingBehavior.transform_json(json_hash['groupingBehavior']) unless json_hash['groupingBehavior'].nil?      
      result['selectionBehavior'] = ActionSelectionBehavior.transform_json(json_hash['selectionBehavior']) unless json_hash['selectionBehavior'].nil?      
      result['requiredBehavior'] = ActionRequiredBehavior.transform_json(json_hash['requiredBehavior']) unless json_hash['requiredBehavior'].nil?      
      result['precheckBehavior'] = ActionPrecheckBehavior.transform_json(json_hash['precheckBehavior']) unless json_hash['precheckBehavior'].nil?      
      result['cardinalityBehavior'] = ActionCardinalityBehavior.transform_json(json_hash['cardinalityBehavior']) unless json_hash['cardinalityBehavior'].nil?      
      result['resource'] = Reference.transform_json(json_hash['resource']) unless json_hash['resource'].nil?      
      result['action'] = json_hash['action'].map { |var| RequestGroupAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
