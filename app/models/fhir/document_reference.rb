module FHIR
  # fhir/document_reference.rb
  class DocumentReference < DomainResource
    include Mongoid::Document
    embeds_one :masterIdentifier, class_name: 'FHIR::Identifier'    
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::DocumentReferenceStatus'    
    embeds_one :docStatus, class_name: 'FHIR::ReferredDocumentStatus'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :date, class_name: 'FHIR::PrimitiveInstant'    
    embeds_many :author, class_name: 'FHIR::Reference'    
    embeds_one :authenticator, class_name: 'FHIR::Reference'    
    embeds_one :custodian, class_name: 'FHIR::Reference'    
    embeds_many :relatesTo, class_name: 'FHIR::DocumentReferenceRelatesTo'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :securityLabel, class_name: 'FHIR::CodeableConcept'    
    embeds_many :content, class_name: 'FHIR::DocumentReferenceContent'    
    embeds_one :context, class_name: 'FHIR::DocumentReferenceContext'    
    
    def as_json(*args)
      result = super      
      unless self.masterIdentifier.nil? 
        result['masterIdentifier'] = self.masterIdentifier.as_json(*args)
      end
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.docStatus.nil? 
        result['docStatus'] = self.docStatus.value
        serialized = Extension.serializePrimitiveExtension(self.docStatus)            
        result['_docStatus'] = serialized unless serialized.nil?
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
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.author.nil?  || !self.author.any? 
        result['author'] = self.author.map{ |x| x.as_json(*args) }
      end
      unless self.authenticator.nil? 
        result['authenticator'] = self.authenticator.as_json(*args)
      end
      unless self.custodian.nil? 
        result['custodian'] = self.custodian.as_json(*args)
      end
      unless self.relatesTo.nil?  || !self.relatesTo.any? 
        result['relatesTo'] = self.relatesTo.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.securityLabel.nil?  || !self.securityLabel.any? 
        result['securityLabel'] = self.securityLabel.map{ |x| x.as_json(*args) }
      end
      unless self.content.nil?  || !self.content.any? 
        result['content'] = self.content.map{ |x| x.as_json(*args) }
      end
      unless self.context.nil? 
        result['context'] = self.context.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DocumentReference.new)
      result = self.superclass.transform_json(json_hash, target)
      result['masterIdentifier'] = Identifier.transform_json(json_hash['masterIdentifier']) unless json_hash['masterIdentifier'].nil?
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['status'] = DocumentReferenceStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['docStatus'] = ReferredDocumentStatus.transform_json(json_hash['docStatus'], json_hash['_docStatus']) unless json_hash['docStatus'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['category'] = json_hash['category'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['category'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['date'] = PrimitiveInstant.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['author'] = json_hash['author'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['author'].nil?
      result['authenticator'] = Reference.transform_json(json_hash['authenticator']) unless json_hash['authenticator'].nil?
      result['custodian'] = Reference.transform_json(json_hash['custodian']) unless json_hash['custodian'].nil?
      result['relatesTo'] = json_hash['relatesTo'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          DocumentReferenceRelatesTo.transform_json(var) 
        end
      } unless json_hash['relatesTo'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['securityLabel'] = json_hash['securityLabel'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['securityLabel'].nil?
      result['content'] = json_hash['content'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          DocumentReferenceContent.transform_json(var) 
        end
      } unless json_hash['content'].nil?
      result['context'] = DocumentReferenceContext.transform_json(json_hash['context']) unless json_hash['context'].nil?

      result
    end
  end
end
