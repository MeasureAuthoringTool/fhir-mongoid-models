module FHIR
  # fhir/medicinal_product_interaction.rb
  class MedicinalProductInteraction < DomainResource
    include Mongoid::Document
    embeds_many :subject, class_name: 'FHIR::Reference'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :interactant, class_name: 'FHIR::MedicinalProductInteractionInteractant'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :effect, class_name: 'FHIR::CodeableConcept'    
    embeds_one :incidence, class_name: 'FHIR::CodeableConcept'    
    embeds_one :management, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.subject.nil?  || !self.subject.any? 
        result['subject'] = self.subject.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.interactant.nil?  || !self.interactant.any? 
        result['interactant'] = self.interactant.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.effect.nil? 
        result['effect'] = self.effect.as_json(*args)
      end
      unless self.incidence.nil? 
        result['incidence'] = self.incidence.as_json(*args)
      end
      unless self.management.nil? 
        result['management'] = self.management.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductInteraction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['subject'] = json_hash['subject'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['subject'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['interactant'] = json_hash['interactant'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MedicinalProductInteractionInteractant.transform_json(var) 
        end
      } unless json_hash['interactant'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['effect'] = CodeableConcept.transform_json(json_hash['effect']) unless json_hash['effect'].nil?
      result['incidence'] = CodeableConcept.transform_json(json_hash['incidence']) unless json_hash['incidence'].nil?
      result['management'] = CodeableConcept.transform_json(json_hash['management']) unless json_hash['management'].nil?

      result
    end
  end
end
