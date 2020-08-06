module FHIR
  # fhir/person.rb
  class Person < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :name, class_name: 'FHIR::HumanName'    
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'    
    embeds_one :gender, class_name: 'FHIR::AdministrativeGender'    
    embeds_one :birthDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_many :address, class_name: 'FHIR::Address'    
    embeds_one :photo, class_name: 'FHIR::Attachment'    
    embeds_one :managingOrganization, class_name: 'FHIR::Reference'    
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :link, class_name: 'FHIR::PersonLink'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.name.nil?  || !self.name.any? 
        result['name'] = self.name.map{ |x| x.as_json(*args) }
      end
      unless self.telecom.nil?  || !self.telecom.any? 
        result['telecom'] = self.telecom.map{ |x| x.as_json(*args) }
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
      unless self.address.nil?  || !self.address.any? 
        result['address'] = self.address.map{ |x| x.as_json(*args) }
      end
      unless self.photo.nil? 
        result['photo'] = self.photo.as_json(*args)
      end
      unless self.managingOrganization.nil? 
        result['managingOrganization'] = self.managingOrganization.as_json(*args)
      end
      unless self.active.nil? 
        result['active'] = self.active.value
        serialized = Extension.serializePrimitiveExtension(self.active)            
        result['_active'] = serialized unless serialized.nil?
      end
      unless self.link.nil?  || !self.link.any? 
        result['link'] = self.link.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Person.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['name'] = json_hash['name'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          HumanName.transform_json(var) 
        end
      } unless json_hash['name'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ContactPoint.transform_json(var) 
        end
      } unless json_hash['telecom'].nil?
      result['gender'] = AdministrativeGender.transform_json(json_hash['gender'], json_hash['_gender']) unless json_hash['gender'].nil?
      result['birthDate'] = PrimitiveDate.transform_json(json_hash['birthDate'], json_hash['_birthDate']) unless json_hash['birthDate'].nil?
      result['address'] = json_hash['address'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Address.transform_json(var) 
        end
      } unless json_hash['address'].nil?
      result['photo'] = Attachment.transform_json(json_hash['photo']) unless json_hash['photo'].nil?
      result['managingOrganization'] = Reference.transform_json(json_hash['managingOrganization']) unless json_hash['managingOrganization'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?
      result['link'] = json_hash['link'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          PersonLink.transform_json(var) 
        end
      } unless json_hash['link'].nil?

      result
    end
  end
end
