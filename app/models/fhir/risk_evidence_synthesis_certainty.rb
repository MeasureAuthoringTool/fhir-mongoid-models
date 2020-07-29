module FHIR
  # fhir/risk_evidence_synthesis_certainty.rb
  class RiskEvidenceSynthesisCertainty < BackboneElement
    include Mongoid::Document
    embeds_many :rating, class_name: 'FHIR::CodeableConcept'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :certaintySubcomponent, class_name: 'FHIR::RiskEvidenceSynthesisCertaintyCertaintySubcomponent'    

    def self.transform_json(json_hash, target = RiskEvidenceSynthesisCertainty.new)
      result = self.superclass.transform_json(json_hash, target)
      result['rating'] = json_hash['rating'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['rating'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['certaintySubcomponent'] = json_hash['certaintySubcomponent'].map { |var| RiskEvidenceSynthesisCertaintyCertaintySubcomponent.transform_json(var) } unless json_hash['certaintySubcomponent'].nil?

      result
    end
  end
end
