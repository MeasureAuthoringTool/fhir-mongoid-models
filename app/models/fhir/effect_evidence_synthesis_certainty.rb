module FHIR
  # fhir/effect_evidence_synthesis_certainty.rb
  class EffectEvidenceSynthesisCertainty < BackboneElement
    include Mongoid::Document
    embeds_many :rating, class_name: 'FHIR::CodeableConcept'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :certaintySubcomponent, class_name: 'FHIR::EffectEvidenceSynthesisCertaintyCertaintySubcomponent'    
    
    def as_json(*args)
      result = super      
      unless self.rating.nil?  || !self.rating.any? 
        result['rating'] = self.rating.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.certaintySubcomponent.nil?  || !self.certaintySubcomponent.any? 
        result['certaintySubcomponent'] = self.certaintySubcomponent.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EffectEvidenceSynthesisCertainty.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['rating'] = json_hash['rating'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['rating'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['certaintySubcomponent'] = json_hash['certaintySubcomponent'].map { |var| EffectEvidenceSynthesisCertaintyCertaintySubcomponent.transform_json(var) } unless json_hash['certaintySubcomponent'].nil?

      result
    end
  end
end
