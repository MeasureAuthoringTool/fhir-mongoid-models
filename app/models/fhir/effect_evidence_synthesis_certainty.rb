module FHIR
  # fhir/effect_evidence_synthesis_certainty.rb
  class EffectEvidenceSynthesisCertainty < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EffectEvidenceSynthesisCertainty'
    embeds_many :rating, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :certaintySubcomponent, class_name: 'EffectEvidenceSynthesisCertaintyCertaintySubcomponent'

    def self.transform_json(json_hash, target=EffectEvidenceSynthesisCertainty.new)
      result = self.superclass.transform_json(json_hash, target)
      result['rating'] = json_hash['rating'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['rating'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['certaintySubcomponent'] = json_hash['certaintySubcomponent'].map { |var| EffectEvidenceSynthesisCertaintyCertaintySubcomponent.transform_json(var) } unless json_hash['certaintySubcomponent'].nil?

      result
    end
  end
end
