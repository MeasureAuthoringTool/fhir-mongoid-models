module FHIR
  # fhir/basic.rb
  class Basic < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :author, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.created.nil? 
        result['created'] = self.created.value
        serialized = Extension.serializePrimitiveExtension(self.created)            
        result['_created'] = serialized unless serialized.nil?
      end
      unless self.author.nil? 
        result['author'] = self.author.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Basic.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['created'] = PrimitiveDate.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?

      result
    end
  end
end
