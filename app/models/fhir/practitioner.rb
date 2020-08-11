module FHIR
  # fhir/practitioner.rb
  class Practitioner < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :name, class_name: 'FHIR::HumanName'    
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'    
    embeds_many :address, class_name: 'FHIR::Address'    
    embeds_one :gender, class_name: 'FHIR::AdministrativeGender'    
    embeds_one :birthDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_many :photo, class_name: 'FHIR::Attachment'    
    embeds_many :qualification, class_name: 'FHIR::PractitionerQualification'    
    embeds_many :communication, class_name: 'FHIR::CodeableConcept'    
    
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
      unless self.name.nil?  || !self.name.any? 
        result['name'] = self.name.map{ |x| x.as_json(*args) }
      end
      unless self.telecom.nil?  || !self.telecom.any? 
        result['telecom'] = self.telecom.map{ |x| x.as_json(*args) }
      end
      unless self.address.nil?  || !self.address.any? 
        result['address'] = self.address.map{ |x| x.as_json(*args) }
      end
      unless self.gender.nil? 
        result['gender'] = self.gender.value
        serialized = Extension.serializePrimitiveExtension(self.gender)            
        result['_gender'] = serialized unless serialized.nil?
      end
      unless self.birthDate.nil? 
        result['birthDate'] = self.birthDate.value
        serialized = Extension.serializePrimitiveExtension(self.birthDate)            
        result['_birthDate'] = serialized unless serialized.nil?
      end
      unless self.photo.nil?  || !self.photo.any? 
        result['photo'] = self.photo.map{ |x| x.as_json(*args) }
      end
      unless self.qualification.nil?  || !self.qualification.any? 
        result['qualification'] = self.qualification.map{ |x| x.as_json(*args) }
      end
      unless self.communication.nil?  || !self.communication.any? 
        result['communication'] = self.communication.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Practitioner.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?
      result['name'] = json_hash['name'].map { |var| HumanName.transform_json(var) } unless json_hash['name'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['address'] = json_hash['address'].map { |var| Address.transform_json(var) } unless json_hash['address'].nil?
      result['gender'] = AdministrativeGender.transform_json(json_hash['gender'], json_hash['_gender']) unless json_hash['gender'].nil?
      result['birthDate'] = PrimitiveDate.transform_json(json_hash['birthDate'], json_hash['_birthDate']) unless json_hash['birthDate'].nil?
      result['photo'] = json_hash['photo'].map { |var| Attachment.transform_json(var) } unless json_hash['photo'].nil?
      result['qualification'] = json_hash['qualification'].map { |var| PractitionerQualification.transform_json(var) } unless json_hash['qualification'].nil?
      result['communication'] = json_hash['communication'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['communication'].nil?

      result
    end
  end
end
