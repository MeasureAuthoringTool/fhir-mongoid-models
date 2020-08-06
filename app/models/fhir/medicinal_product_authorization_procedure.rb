module FHIR
  # fhir/medicinal_product_authorization_procedure.rb
  class MedicinalProductAuthorizationProcedure < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :datePeriod, class_name: 'FHIR::Period'    
    embeds_one :dateDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :application, class_name: 'FHIR::MedicinalProductAuthorizationProcedure'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.datePeriod.nil?
        result['datePeriod'] = self.datePeriod.as_json(*args)                        
      end          
      unless self.dateDateTime.nil?
        result['dateDateTime'] = self.dateDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.dateDateTime) 
        result['_dateDateTime'] = serialized unless serialized.nil?
      end          
      unless self.application.nil?  || !self.application.any? 
        result['application'] = self.application.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductAuthorizationProcedure.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['datePeriod'] = Period.transform_json(json_hash['datePeriod']) unless json_hash['datePeriod'].nil?
      result['dateDateTime'] = PrimitiveDateTime.transform_json(json_hash['dateDateTime'], json_hash['_dateDateTime']) unless json_hash['dateDateTime'].nil?
      result['application'] = json_hash['application'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MedicinalProductAuthorizationProcedure.transform_json(var) 
        end
      } unless json_hash['application'].nil?

      result
    end
  end
end
