module FHIR
  # fhir/organization_contact.rb
  class OrganizationContact < BackboneElement
    include Mongoid::Document
    embeds_one :purpose, class_name: 'FHIR::CodeableConcept'    
    embeds_one :name, class_name: 'FHIR::HumanName'    
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'    
    embeds_one :address, class_name: 'FHIR::Address'    
    
    def as_json(*args)
      result = super      
      unless self.purpose.nil? 
        result['purpose'] = self.purpose.as_json(*args)
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
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = OrganizationContact.new)
      result = self.superclass.transform_json(json_hash, target)
      result['purpose'] = CodeableConcept.transform_json(json_hash['purpose']) unless json_hash['purpose'].nil?
      result['name'] = HumanName.transform_json(json_hash['name']) unless json_hash['name'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ContactPoint.transform_json(var) 
        end
      } unless json_hash['telecom'].nil?
      result['address'] = Address.transform_json(json_hash['address']) unless json_hash['address'].nil?

      result
    end
  end
end
