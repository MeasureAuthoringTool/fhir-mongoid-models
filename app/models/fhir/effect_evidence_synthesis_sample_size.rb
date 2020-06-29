module FHIR
  # fhir/effect_evidence_synthesis_sample_size.rb
  class EffectEvidenceSynthesisSampleSize < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EffectEvidenceSynthesisSampleSize'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :numberOfStudies, class_name: 'PrimitiveInteger'
    embeds_one :numberOfParticipants, class_name: 'PrimitiveInteger'

    def self.transform_json(json_hash, target=EffectEvidenceSynthesisSampleSize.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['numberOfStudies'] = PrimitiveInteger.transform_json(json_hash['numberOfStudies'], json_hash['_numberOfStudies']) unless json_hash['numberOfStudies'].nil?      
      result['numberOfParticipants'] = PrimitiveInteger.transform_json(json_hash['numberOfParticipants'], json_hash['_numberOfParticipants']) unless json_hash['numberOfParticipants'].nil?      

      result
    end
  end
end
