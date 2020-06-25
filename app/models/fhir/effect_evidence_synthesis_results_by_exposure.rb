module FHIR
  # fhir/effect_evidence_synthesis_results_by_exposure.rb
  class EffectEvidenceSynthesisResultsByExposure < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EffectEvidenceSynthesisResultsByExposure'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :exposureState, class_name: 'ExposureState'
    embeds_one :variantState, class_name: 'CodeableConcept'
    embeds_one :riskEvidenceSynthesis, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = EffectEvidenceSynthesisResultsByExposure.new
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['exposureState'] = ExposureState.transform_json(json_hash['exposureState']) unless json_hash['exposureState'].nil?      
      result['variantState'] = CodeableConcept.transform_json(json_hash['variantState']) unless json_hash['variantState'].nil?      
      result['riskEvidenceSynthesis'] = Reference.transform_json(json_hash['riskEvidenceSynthesis']) unless json_hash['riskEvidenceSynthesis'].nil?      

      result
    end
  end
end
