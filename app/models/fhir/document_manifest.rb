module FHIR
  # fhir/document_manifest.rb
  class DocumentManifest < DomainResource
    include Mongoid::Document
    embeds_one :masterIdentifier, class_name: 'FHIR::Identifier'    
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::DocumentReferenceStatus'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :author, class_name: 'FHIR::Reference'    
    embeds_many :recipient, class_name: 'FHIR::Reference'    
    embeds_one :source, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :content, class_name: 'FHIR::Reference'    
    embeds_many :related, class_name: 'FHIR::DocumentManifestRelated'    
    
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
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.created.nil? 
        result['created'] = self.created.value
        serialized = Extension.serializePrimitiveExtension(self.created)            
        result['_created'] = serialized unless serialized.nil?
      end
      unless self.author.nil?  || !self.author.any? 
        result['author'] = self.author.map{ |x| x.as_json(*args) }
      end
      unless self.recipient.nil?  || !self.recipient.any? 
        result['recipient'] = self.recipient.map{ |x| x.as_json(*args) }
      end
      unless self.source.nil? 
        result['source'] = self.source.value
        serialized = Extension.serializePrimitiveExtension(self.source)            
        result['_source'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.content.nil?  || !self.content.any? 
        result['content'] = self.content.map{ |x| x.as_json(*args) }
      end
      unless self.related.nil?  || !self.related.any? 
        result['related'] = self.related.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DocumentManifest.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['masterIdentifier'] = Identifier.transform_json(json_hash['masterIdentifier']) unless json_hash['masterIdentifier'].nil?
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = DocumentReferenceStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['author'] = json_hash['author'].map { |var| Reference.transform_json(var) } unless json_hash['author'].nil?
      result['recipient'] = json_hash['recipient'].map { |var| Reference.transform_json(var) } unless json_hash['recipient'].nil?
      result['source'] = PrimitiveUri.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['content'] = json_hash['content'].map { |var| Reference.transform_json(var) } unless json_hash['content'].nil?
      result['related'] = json_hash['related'].map { |var| DocumentManifestRelated.transform_json(var) } unless json_hash['related'].nil?

      result
    end
  end
end
