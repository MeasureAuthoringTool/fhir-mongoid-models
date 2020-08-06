module FHIR
  # fhir/medicinal_product_pharmaceutical.rb
  class MedicinalProductPharmaceutical < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :administrableDoseForm, class_name: 'FHIR::CodeableConcept'    
    embeds_one :unitOfPresentation, class_name: 'FHIR::CodeableConcept'    
    embeds_many :ingredient, class_name: 'FHIR::Reference'    
    embeds_many :device, class_name: 'FHIR::Reference'    
    embeds_many :characteristics, class_name: 'FHIR::MedicinalProductPharmaceuticalCharacteristics'    
    embeds_many :routeOfAdministration, class_name: 'FHIR::MedicinalProductPharmaceuticalRouteOfAdministration'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.administrableDoseForm.nil? 
        result['administrableDoseForm'] = self.administrableDoseForm.as_json(*args)
      end
      unless self.unitOfPresentation.nil? 
        result['unitOfPresentation'] = self.unitOfPresentation.as_json(*args)
      end
      unless self.ingredient.nil?  || !self.ingredient.any? 
        result['ingredient'] = self.ingredient.map{ |x| x.as_json(*args) }
      end
      unless self.device.nil?  || !self.device.any? 
        result['device'] = self.device.map{ |x| x.as_json(*args) }
      end
      unless self.characteristics.nil?  || !self.characteristics.any? 
        result['characteristics'] = self.characteristics.map{ |x| x.as_json(*args) }
      end
      unless self.routeOfAdministration.nil?  || !self.routeOfAdministration.any? 
        result['routeOfAdministration'] = self.routeOfAdministration.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductPharmaceutical.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['administrableDoseForm'] = CodeableConcept.transform_json(json_hash['administrableDoseForm']) unless json_hash['administrableDoseForm'].nil?
      result['unitOfPresentation'] = CodeableConcept.transform_json(json_hash['unitOfPresentation']) unless json_hash['unitOfPresentation'].nil?
      result['ingredient'] = json_hash['ingredient'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['ingredient'].nil?
      result['device'] = json_hash['device'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['device'].nil?
      result['characteristics'] = json_hash['characteristics'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MedicinalProductPharmaceuticalCharacteristics.transform_json(var) 
        end
      } unless json_hash['characteristics'].nil?
      result['routeOfAdministration'] = json_hash['routeOfAdministration'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MedicinalProductPharmaceuticalRouteOfAdministration.transform_json(var) 
        end
      } unless json_hash['routeOfAdministration'].nil?

      result
    end
  end
end
