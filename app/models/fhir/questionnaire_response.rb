module FHIR
  # fhir/questionnaire_response.rb
  class QuestionnaireResponse < DomainResource
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_many :partOf, class_name: 'FHIR::Reference'    
    embeds_one :questionnaire, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :status, class_name: 'FHIR::QuestionnaireResponseStatus'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :authored, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :author, class_name: 'FHIR::Reference'    
    embeds_one :source, class_name: 'FHIR::Reference'    
    embeds_many :item, class_name: 'FHIR::QuestionnaireResponseItem'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.basedOn.nil?  || !self.basedOn.any? 
        result['basedOn'] = self.basedOn.map{ |x| x.as_json(*args) }
      end
      unless self.partOf.nil?  || !self.partOf.any? 
        result['partOf'] = self.partOf.map{ |x| x.as_json(*args) }
      end
      unless self.questionnaire.nil? 
        result['questionnaire'] = self.questionnaire.value
        serialized = Extension.serializePrimitiveExtension(self.questionnaire)            
        result['_questionnaire'] = serialized unless serialized.nil?
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.authored.nil? 
        result['authored'] = self.authored.value
        serialized = Extension.serializePrimitiveExtension(self.authored)            
        result['_authored'] = serialized unless serialized.nil?
      end
      unless self.author.nil? 
        result['author'] = self.author.as_json(*args)
      end
      unless self.source.nil? 
        result['source'] = self.source.as_json(*args)
      end
      unless self.item.nil?  || !self.item.any? 
        result['item'] = self.item.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = QuestionnaireResponse.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['basedOn'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['partOf'].nil?
      result['questionnaire'] = PrimitiveCanonical.transform_json(json_hash['questionnaire'], json_hash['_questionnaire']) unless json_hash['questionnaire'].nil?
      result['status'] = QuestionnaireResponseStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['authored'] = PrimitiveDateTime.transform_json(json_hash['authored'], json_hash['_authored']) unless json_hash['authored'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?
      result['source'] = Reference.transform_json(json_hash['source']) unless json_hash['source'].nil?
      result['item'] = json_hash['item'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          QuestionnaireResponseItem.transform_json(var) 
        end
      } unless json_hash['item'].nil?

      result
    end
  end
end
