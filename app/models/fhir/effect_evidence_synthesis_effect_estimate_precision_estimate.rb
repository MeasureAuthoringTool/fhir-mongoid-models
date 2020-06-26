module FHIR
  # fhir/effect_evidence_synthesis_effect_estimate_precision_estimate.rb
  class EffectEvidenceSynthesisEffectEstimatePrecisionEstimate < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EffectEvidenceSynthesisEffectEstimatePrecisionEstimate'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :level, class_name: 'PrimitiveDecimal'
    embeds_one :from, class_name: 'PrimitiveDecimal'
    embeds_one :to, class_name: 'PrimitiveDecimal'

    def self.transform_json(json_hash)
      result = EffectEvidenceSynthesisEffectEstimatePrecisionEstimate.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['level'] = PrimitiveDecimal.transform_json(json_hash['level'], json_hash['_level']) unless json_hash['level'].nil?      
      result['from'] = PrimitiveDecimal.transform_json(json_hash['from'], json_hash['_from']) unless json_hash['from'].nil?      
      result['to'] = PrimitiveDecimal.transform_json(json_hash['to'], json_hash['_to']) unless json_hash['to'].nil?      

      result
    end
  end
end
