module FHIR
  # fhir/effect_evidence_synthesis_certainty_certainty_subcomponent.rb
  class EffectEvidenceSynthesisCertaintyCertaintySubcomponent < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :rating, class_name: 'FHIR::CodeableConcept'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.rating.nil?  || !self.rating.any? 
        result['rating'] = self.rating.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EffectEvidenceSynthesisCertaintyCertaintySubcomponent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['rating'] = json_hash['rating'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['rating'].nil?
      result['note'] = json_hash['note'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Annotation.transform_json(var) 
        end
      } unless json_hash['note'].nil?

      result
    end
  end
end
