module FHIR
  # fhir/condition_stage.rb
  class ConditionStage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConditionStage'
    embeds_one :summary, class_name: 'CodeableConcept'
    embeds_many :assessment, class_name: 'Reference'
    embeds_one :type, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target=ConditionStage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['summary'] = CodeableConcept.transform_json(json_hash['summary']) unless json_hash['summary'].nil?      
      result['assessment'] = json_hash['assessment'].map { |var| Reference.transform_json(var) } unless json_hash['assessment'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      

      result
    end
  end
end
