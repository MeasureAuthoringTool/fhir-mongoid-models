module FHIR
  # fhir/care_plan_activity.rb
  class CarePlanActivity < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CarePlanActivity'
    embeds_many :outcomeCodeableConcept, class_name: 'CodeableConcept'
    embeds_many :outcomeReference, class_name: 'Reference'
    embeds_many :progress, class_name: 'Annotation'
    embeds_one :reference, class_name: 'Reference'
    embeds_one :detail, class_name: 'CarePlanActivityDetail'

    def self.transform_json(json_hash, target=CarePlanActivity.new)
      result = self.superclass.transform_json(json_hash, target)
      result['outcomeCodeableConcept'] = json_hash['outcomeCodeableConcept'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['outcomeCodeableConcept'].nil?
      result['outcomeReference'] = json_hash['outcomeReference'].map { |var| Reference.transform_json(var) } unless json_hash['outcomeReference'].nil?
      result['progress'] = json_hash['progress'].map { |var| Annotation.transform_json(var) } unless json_hash['progress'].nil?
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?      
      result['detail'] = CarePlanActivityDetail.transform_json(json_hash['detail']) unless json_hash['detail'].nil?      

      result
    end
  end
end
