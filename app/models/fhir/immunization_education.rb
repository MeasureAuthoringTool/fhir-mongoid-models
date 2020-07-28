module FHIR
  # fhir/immunization_education.rb
  class ImmunizationEducation < BackboneElement
    include Mongoid::Document
    embeds_one :documentType, class_name: 'FHIR::PrimitiveString'    
    embeds_one :reference, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :publicationDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :presentationDate, class_name: 'FHIR::PrimitiveDateTime'    

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
