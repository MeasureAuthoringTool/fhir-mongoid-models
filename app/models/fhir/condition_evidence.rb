module FHIR
  # fhir/condition_evidence.rb
  class ConditionEvidence < BackboneElement
    include Mongoid::Document
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_many :detail, class_name: 'Reference'

    def self.transform_json(json_hash, target = ConditionEvidence.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['detail'] = json_hash['detail'].map { |var| Reference.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
