module FHIR
  # fhir/contract_content_definition.rb
  class ContractContentDefinition < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :publisher, class_name: 'FHIR::Reference'    
    embeds_one :publicationDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :publicationStatus, class_name: 'FHIR::ContractPublicationStatus'    
    embeds_one :copyright, class_name: 'FHIR::PrimitiveMarkdown'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.subType.nil? 
        result['subType'] = self.subType.as_json(*args)
      end
      unless self.publisher.nil? 
        result['publisher'] = self.publisher.as_json(*args)
      end
      unless self.publicationDate.nil? 
        result['publicationDate'] = self.publicationDate.value
        serialized = Extension.serializePrimitiveExtension(self.publicationDate)            
        result['_publicationDate'] = serialized unless serialized.nil?
      end
      unless self.publicationStatus.nil? 
        result['publicationStatus'] = self.publicationStatus.value
        serialized = Extension.serializePrimitiveExtension(self.publicationStatus)            
        result['_publicationStatus'] = serialized unless serialized.nil?
      end
      unless self.copyright.nil? 
        result['copyright'] = self.copyright.value
        serialized = Extension.serializePrimitiveExtension(self.copyright)            
        result['_copyright'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ContractContentDefinition.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['subType'] = CodeableConcept.transform_json(json_hash['subType']) unless json_hash['subType'].nil?
      result['publisher'] = Reference.transform_json(json_hash['publisher']) unless json_hash['publisher'].nil?
      result['publicationDate'] = PrimitiveDateTime.transform_json(json_hash['publicationDate'], json_hash['_publicationDate']) unless json_hash['publicationDate'].nil?
      result['publicationStatus'] = ContractPublicationStatus.transform_json(json_hash['publicationStatus'], json_hash['_publicationStatus']) unless json_hash['publicationStatus'].nil?
      result['copyright'] = PrimitiveMarkdown.transform_json(json_hash['copyright'], json_hash['_copyright']) unless json_hash['copyright'].nil?

      result
    end
  end
end
