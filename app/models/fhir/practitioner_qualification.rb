module FHIR
  # fhir/practitioner_qualification.rb
  class PractitionerQualification < BackboneElement
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :issuer, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.issuer.nil? 
        result['issuer'] = self.issuer.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PractitionerQualification.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['issuer'] = Reference.transform_json(json_hash['issuer']) unless json_hash['issuer'].nil?

      result
    end
  end
end
