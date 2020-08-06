module FHIR
  # fhir/immunization_education.rb
  class ImmunizationEducation < BackboneElement
    include Mongoid::Document
    embeds_one :documentType, class_name: 'FHIR::PrimitiveString'    
    embeds_one :reference, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :publicationDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :presentationDate, class_name: 'FHIR::PrimitiveDateTime'    
    
    def as_json(*args)
      result = super      
      unless self.documentType.nil? 
        result['documentType'] = self.documentType.value
        serialized = Extension.serializePrimitiveExtension(self.documentType)            
        result['_documentType'] = serialized unless serialized.nil?
      end
      unless self.reference.nil? 
        result['reference'] = self.reference.value
        serialized = Extension.serializePrimitiveExtension(self.reference)            
        result['_reference'] = serialized unless serialized.nil?
      end
      unless self.publicationDate.nil? 
        result['publicationDate'] = self.publicationDate.value
        serialized = Extension.serializePrimitiveExtension(self.publicationDate)            
        result['_publicationDate'] = serialized unless serialized.nil?
      end
      unless self.presentationDate.nil? 
        result['presentationDate'] = self.presentationDate.value
        serialized = Extension.serializePrimitiveExtension(self.presentationDate)            
        result['_presentationDate'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImmunizationEducation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['documentType'] = PrimitiveString.transform_json(json_hash['documentType'], json_hash['_documentType']) unless json_hash['documentType'].nil?
      result['reference'] = PrimitiveUri.transform_json(json_hash['reference'], json_hash['_reference']) unless json_hash['reference'].nil?
      result['publicationDate'] = PrimitiveDateTime.transform_json(json_hash['publicationDate'], json_hash['_publicationDate']) unless json_hash['publicationDate'].nil?
      result['presentationDate'] = PrimitiveDateTime.transform_json(json_hash['presentationDate'], json_hash['_presentationDate']) unless json_hash['presentationDate'].nil?

      result
    end
  end
end
