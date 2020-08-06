module FHIR
  # fhir/composition.rb
  class Composition < DomainResource
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::CompositionStatus'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :author, class_name: 'FHIR::Reference'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :confidentiality, class_name: 'FHIR::DocumentConfidentiality'    
    embeds_many :attester, class_name: 'FHIR::CompositionAttester'    
    embeds_one :custodian, class_name: 'FHIR::Reference'    
    embeds_many :relatesTo, class_name: 'FHIR::CompositionRelatesTo'    
    embeds_many :event, class_name: 'FHIR::CompositionEvent'    
    embeds_many :section, class_name: 'FHIR::CompositionSection'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.map{ |x| x.as_json(*args) }
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.author.nil?  || !self.author.any? 
        result['author'] = self.author.map{ |x| x.as_json(*args) }
      end
      unless self.title.nil? 
        result['title'] = self.title.value
        serialized = Extension.serializePrimitiveExtension(self.title)            
        result['_title'] = serialized unless serialized.nil?
      end
      unless self.confidentiality.nil? 
        result['confidentiality'] = self.confidentiality.value
        serialized = Extension.serializePrimitiveExtension(self.confidentiality)            
        result['_confidentiality'] = serialized unless serialized.nil?
      end
      unless self.attester.nil?  || !self.attester.any? 
        result['attester'] = self.attester.map{ |x| x.as_json(*args) }
      end
      unless self.custodian.nil? 
        result['custodian'] = self.custodian.as_json(*args)
      end
      unless self.relatesTo.nil?  || !self.relatesTo.any? 
        result['relatesTo'] = self.relatesTo.map{ |x| x.as_json(*args) }
      end
      unless self.event.nil?  || !self.event.any? 
        result['event'] = self.event.map{ |x| x.as_json(*args) }
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

    def self.transform_json(json_hash, target = Composition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['status'] = CompositionStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['category'] = json_hash['category'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['category'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['author'] = json_hash['author'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['author'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['confidentiality'] = DocumentConfidentiality.transform_json(json_hash['confidentiality'], json_hash['_confidentiality']) unless json_hash['confidentiality'].nil?
      result['attester'] = json_hash['attester'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CompositionAttester.transform_json(var) 
        end
      } unless json_hash['attester'].nil?
      result['custodian'] = Reference.transform_json(json_hash['custodian']) unless json_hash['custodian'].nil?
      result['relatesTo'] = json_hash['relatesTo'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CompositionRelatesTo.transform_json(var) 
        end
      } unless json_hash['relatesTo'].nil?
      result['event'] = json_hash['event'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CompositionEvent.transform_json(var) 
        end
      } unless json_hash['event'].nil?
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
