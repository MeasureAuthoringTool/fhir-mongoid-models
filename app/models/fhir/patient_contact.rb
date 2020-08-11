module FHIR
  # fhir/patient_contact.rb
  class PatientContact < BackboneElement
    include Mongoid::Document
    embeds_many :relationship, class_name: 'FHIR::CodeableConcept'    
    embeds_one :name, class_name: 'FHIR::HumanName'    
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'    
    embeds_one :address, class_name: 'FHIR::Address'    
    embeds_one :gender, class_name: 'FHIR::AdministrativeGender'    
    embeds_one :organization, class_name: 'FHIR::Reference'    
    embeds_one :period, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.relationship.nil?  || !self.relationship.any? 
        result['relationship'] = self.relationship.map{ |x| x.as_json(*args) }
      end
      unless self.name.nil? 
        result['name'] = self.name.as_json(*args)
      end
      unless self.telecom.nil?  || !self.telecom.any? 
        result['telecom'] = self.telecom.map{ |x| x.as_json(*args) }
      end
      unless self.address.nil? 
        result['address'] = self.address.as_json(*args)
      end
      unless self.gender.nil? 
        result['gender'] = self.gender.value
        serialized = Extension.serializePrimitiveExtension(self.gender)            
        result['_gender'] = serialized unless serialized.nil?
      end
      unless self.organization.nil? 
        result['organization'] = self.organization.as_json(*args)
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PatientContact.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['relationship'] = json_hash['relationship'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['relationship'].nil?
      result['name'] = HumanName.transform_json(json_hash['name']) unless json_hash['name'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['address'] = Address.transform_json(json_hash['address']) unless json_hash['address'].nil?
      result['gender'] = AdministrativeGender.transform_json(json_hash['gender'], json_hash['_gender']) unless json_hash['gender'].nil?
      result['organization'] = Reference.transform_json(json_hash['organization']) unless json_hash['organization'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
