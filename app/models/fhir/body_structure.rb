module FHIR
  # fhir/body_structure.rb
  class BodyStructure < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :morphology, class_name: 'FHIR::CodeableConcept'    
    embeds_one :location, class_name: 'FHIR::CodeableConcept'    
    embeds_many :locationQualifier, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :image, class_name: 'FHIR::Attachment'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.active.nil? 
        result['active'] = self.active.value
        serialized = Extension.serializePrimitiveExtension(self.active)            
        result['_active'] = serialized unless serialized.nil?
      end
      unless self.morphology.nil? 
        result['morphology'] = self.morphology.as_json(*args)
      end
      unless self.location.nil? 
        result['location'] = self.location.as_json(*args)
      end
      unless self.locationQualifier.nil?  || !self.locationQualifier.any? 
        result['locationQualifier'] = self.locationQualifier.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.image.nil?  || !self.image.any? 
        result['image'] = self.image.map{ |x| x.as_json(*args) }
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = BodyStructure.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?
      result['morphology'] = CodeableConcept.transform_json(json_hash['morphology']) unless json_hash['morphology'].nil?
      result['location'] = CodeableConcept.transform_json(json_hash['location']) unless json_hash['location'].nil?
      result['locationQualifier'] = json_hash['locationQualifier'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['locationQualifier'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['image'] = json_hash['image'].map { |var| Attachment.transform_json(var) } unless json_hash['image'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?

      result
    end
  end
end
