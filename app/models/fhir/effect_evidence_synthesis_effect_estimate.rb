module FHIR
  # fhir/effect_evidence_synthesis_effect_estimate.rb
  class EffectEvidenceSynthesisEffectEstimate < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EffectEvidenceSynthesisEffectEstimate'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :variantState, class_name: 'CodeableConcept'
    embeds_one :value, class_name: 'PrimitiveDecimal'
    embeds_one :unitOfMeasure, class_name: 'CodeableConcept'
    embeds_many :precisionEstimate, class_name: 'EffectEvidenceSynthesisEffectEstimatePrecisionEstimate'

    def self.transform_json(json_hash)
      result = EffectEvidenceSynthesisEffectEstimate.new
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['variantState'] = CodeableConcept.transform_json(json_hash['variantState']) unless json_hash['variantState'].nil?      
      result['value'] = PrimitiveDecimal.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      
      result['unitOfMeasure'] = CodeableConcept.transform_json(json_hash['unitOfMeasure']) unless json_hash['unitOfMeasure'].nil?      
      result['precisionEstimate'] = json_hash['precisionEstimate'].map { |var| EffectEvidenceSynthesisEffectEstimatePrecisionEstimate.transform_json(var) } unless json_hash['precisionEstimate'].nil?

      result
    end
  end
end
