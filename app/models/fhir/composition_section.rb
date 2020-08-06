module FHIR
  # fhir/composition_section.rb
  class CompositionSection < BackboneElement
    include Mongoid::Document
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :author, class_name: 'FHIR::Reference'    
    embeds_one :focus, class_name: 'FHIR::Reference'    
    embeds_one :text, class_name: 'FHIR::Narrative'    
    embeds_one :mode, class_name: 'FHIR::SectionMode'    
    embeds_one :orderedBy, class_name: 'FHIR::CodeableConcept'    
    embeds_many :entry, class_name: 'FHIR::Reference'    
    embeds_one :emptyReason, class_name: 'FHIR::CodeableConcept'    
    embeds_many :section, class_name: 'FHIR::CompositionSection'    
    
    def as_json(*args)
      result = super      
      unless self.title.nil? 
        result['title'] = self.title.value
        serialized = Extension.serializePrimitiveExtension(self.title)            
        result['_title'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.author.nil?  || !self.author.any? 
        result['author'] = self.author.map{ |x| x.as_json(*args) }
      end
      unless self.focus.nil? 
        result['focus'] = self.focus.as_json(*args)
      end
      unless self.text.nil? 
        result['text'] = self.text.as_json(*args)
      end
      unless self.mode.nil? 
        result['mode'] = self.mode.value
        serialized = Extension.serializePrimitiveExtension(self.mode)            
        result['_mode'] = serialized unless serialized.nil?
      end
      unless self.orderedBy.nil? 
        result['orderedBy'] = self.orderedBy.as_json(*args)
      end
      unless self.entry.nil?  || !self.entry.any? 
        result['entry'] = self.entry.map{ |x| x.as_json(*args) }
      end
      unless self.emptyReason.nil? 
        result['emptyReason'] = self.emptyReason.as_json(*args)
      end
      unless self.section.nil?  || !self.section.any? 
        result['section'] = self.section.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CompositionSection.new)
      result = self.superclass.transform_json(json_hash, target)
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['author'] = json_hash['author'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['author'].nil?
      result['focus'] = Reference.transform_json(json_hash['focus']) unless json_hash['focus'].nil?
      result['text'] = Narrative.transform_json(json_hash['text']) unless json_hash['text'].nil?
      result['mode'] = SectionMode.transform_json(json_hash['mode'], json_hash['_mode']) unless json_hash['mode'].nil?
      result['orderedBy'] = CodeableConcept.transform_json(json_hash['orderedBy']) unless json_hash['orderedBy'].nil?
      result['entry'] = json_hash['entry'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['entry'].nil?
      result['emptyReason'] = CodeableConcept.transform_json(json_hash['emptyReason']) unless json_hash['emptyReason'].nil?
      result['section'] = json_hash['section'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CompositionSection.transform_json(var) 
        end
      } unless json_hash['section'].nil?

      result
    end
  end
end
