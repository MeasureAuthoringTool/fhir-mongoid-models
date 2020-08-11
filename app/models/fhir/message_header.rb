module FHIR
  # fhir/message_header.rb
  class MessageHeader < DomainResource
    include Mongoid::Document
    embeds_one :eventCoding, class_name: 'FHIR::Coding'    
    embeds_one :eventUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :destination, class_name: 'FHIR::MessageHeaderDestination'    
    embeds_one :sender, class_name: 'FHIR::Reference'    
    embeds_one :enterer, class_name: 'FHIR::Reference'    
    embeds_one :author, class_name: 'FHIR::Reference'    
    embeds_one :source, class_name: 'FHIR::MessageHeaderSource'    
    embeds_one :responsible, class_name: 'FHIR::Reference'    
    embeds_one :reason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :response, class_name: 'FHIR::MessageHeaderResponse'    
    embeds_many :focus, class_name: 'FHIR::Reference'    
    embeds_one :definition, class_name: 'FHIR::PrimitiveCanonical'    
    
    def as_json(*args)
      result = super      
      unless self.eventCoding.nil?
        result['eventCoding'] = self.eventCoding.as_json(*args)                        
      end          
      unless self.eventUri.nil?
        result['eventUri'] = self.eventUri.value                        
        serialized = Extension.serializePrimitiveExtension(self.eventUri) 
        result['_eventUri'] = serialized unless serialized.nil?
      end          
      unless self.destination.nil?  || !self.destination.any? 
        result['destination'] = self.destination.map{ |x| x.as_json(*args) }
      end
      unless self.sender.nil? 
        result['sender'] = self.sender.as_json(*args)
      end
      unless self.enterer.nil? 
        result['enterer'] = self.enterer.as_json(*args)
      end
      unless self.author.nil? 
        result['author'] = self.author.as_json(*args)
      end
      unless self.source.nil? 
        result['source'] = self.source.as_json(*args)
      end
      unless self.responsible.nil? 
        result['responsible'] = self.responsible.as_json(*args)
      end
      unless self.reason.nil? 
        result['reason'] = self.reason.as_json(*args)
      end
      unless self.response.nil? 
        result['response'] = self.response.as_json(*args)
      end
      unless self.focus.nil?  || !self.focus.any? 
        result['focus'] = self.focus.map{ |x| x.as_json(*args) }
      end
      unless self.definition.nil? 
        result['definition'] = self.definition.value
        serialized = Extension.serializePrimitiveExtension(self.definition)            
        result['_definition'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MessageHeader.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['eventCoding'] = Coding.transform_json(json_hash['eventCoding']) unless json_hash['eventCoding'].nil?
      result['eventUri'] = PrimitiveUri.transform_json(json_hash['eventUri'], json_hash['_eventUri']) unless json_hash['eventUri'].nil?
      result['destination'] = json_hash['destination'].map { |var| MessageHeaderDestination.transform_json(var) } unless json_hash['destination'].nil?
      result['sender'] = Reference.transform_json(json_hash['sender']) unless json_hash['sender'].nil?
      result['enterer'] = Reference.transform_json(json_hash['enterer']) unless json_hash['enterer'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?
      result['source'] = MessageHeaderSource.transform_json(json_hash['source']) unless json_hash['source'].nil?
      result['responsible'] = Reference.transform_json(json_hash['responsible']) unless json_hash['responsible'].nil?
      result['reason'] = CodeableConcept.transform_json(json_hash['reason']) unless json_hash['reason'].nil?
      result['response'] = MessageHeaderResponse.transform_json(json_hash['response']) unless json_hash['response'].nil?
      result['focus'] = json_hash['focus'].map { |var| Reference.transform_json(var) } unless json_hash['focus'].nil?
      result['definition'] = PrimitiveCanonical.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?

      result
    end
  end
end
