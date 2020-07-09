module FHIR
  # fhir/effect_evidence_synthesis_results_by_exposure.rb
  class EffectEvidenceSynthesisResultsByExposure < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_one :exposureState, class_name: 'FHIR::ExposureState'
    embeds_one :variantState, class_name: 'FHIR::CodeableConcept'
    embeds_one :riskEvidenceSynthesis, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = EffectEvidenceSynthesisResultsByExposure.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['exposureState'] = ExposureState.transform_json(json_hash['exposureState']) unless json_hash['exposureState'].nil?      
      result['variantState'] = CodeableConcept.transform_json(json_hash['variantState']) unless json_hash['variantState'].nil?      
      result['riskEvidenceSynthesis'] = Reference.transform_json(json_hash['riskEvidenceSynthesis']) unless json_hash['riskEvidenceSynthesis'].nil?      

      result
    end
  end
end
