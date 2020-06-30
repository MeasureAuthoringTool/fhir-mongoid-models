module FHIR
  # fhir/risk_evidence_synthesis_certainty_certainty_subcomponent.rb
  class RiskEvidenceSynthesisCertaintyCertaintySubcomponent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'RiskEvidenceSynthesisCertaintyCertaintySubcomponent'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :rating, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'

    def self.transform_json(json_hash, target=RiskEvidenceSynthesisCertaintyCertaintySubcomponent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['rating'] = json_hash['rating'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['rating'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
