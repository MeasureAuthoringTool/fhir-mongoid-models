module FHIR
  # fhir/risk_evidence_synthesis_sample_size.rb
  class RiskEvidenceSynthesisSampleSize < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :numberOfStudies, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :numberOfParticipants, class_name: 'FHIR::PrimitiveInteger'    

    def self.transform_json(json_hash, target = RiskEvidenceSynthesisSampleSize.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['numberOfStudies'] = PrimitiveInteger.transform_json(json_hash['numberOfStudies'], json_hash['_numberOfStudies']) unless json_hash['numberOfStudies'].nil?
      result['numberOfParticipants'] = PrimitiveInteger.transform_json(json_hash['numberOfParticipants'], json_hash['_numberOfParticipants']) unless json_hash['numberOfParticipants'].nil?

      result
    end
  end
end
