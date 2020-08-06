module FHIR
  # fhir/substance_specification_name.rb
  class SubstanceSpecificationName < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::CodeableConcept'    
    embeds_one :preferred, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :language, class_name: 'FHIR::CodeableConcept'    
    embeds_many :domain, class_name: 'FHIR::CodeableConcept'    
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'    
    embeds_many :synonym, class_name: 'FHIR::SubstanceSpecificationName'    
    embeds_many :translation, class_name: 'FHIR::SubstanceSpecificationName'    
    embeds_many :official, class_name: 'FHIR::SubstanceSpecificationNameOfficial'    
    embeds_many :source, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.as_json(*args)
      end
      unless self.preferred.nil? 
        result['preferred'] = self.preferred.value
        serialized = Extension.serializePrimitiveExtension(self.preferred)            
        result['_preferred'] = serialized unless serialized.nil?
      end
      unless self.language.nil?  || !self.language.any? 
        result['language'] = self.language.map{ |x| x.as_json(*args) }
      end
      unless self.domain.nil?  || !self.domain.any? 
        result['domain'] = self.domain.map{ |x| x.as_json(*args) }
      end
      unless self.jurisdiction.nil?  || !self.jurisdiction.any? 
        result['jurisdiction'] = self.jurisdiction.map{ |x| x.as_json(*args) }
      end
      unless self.synonym.nil?  || !self.synonym.any? 
        result['synonym'] = self.synonym.map{ |x| x.as_json(*args) }
      end
      unless self.translation.nil?  || !self.translation.any? 
        result['translation'] = self.translation.map{ |x| x.as_json(*args) }
      end
      unless self.official.nil?  || !self.official.any? 
        result['official'] = self.official.map{ |x| x.as_json(*args) }
      end
      unless self.source.nil?  || !self.source.any? 
        result['source'] = self.source.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSpecificationName.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['preferred'] = PrimitiveBoolean.transform_json(json_hash['preferred'], json_hash['_preferred']) unless json_hash['preferred'].nil?
      result['language'] = json_hash['language'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['language'].nil?
      result['domain'] = json_hash['domain'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['domain'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['jurisdiction'].nil?
      result['synonym'] = json_hash['synonym'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSpecificationName.transform_json(var) 
        end
      } unless json_hash['synonym'].nil?
      result['translation'] = json_hash['translation'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSpecificationName.transform_json(var) 
        end
      } unless json_hash['translation'].nil?
      result['official'] = json_hash['official'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSpecificationNameOfficial.transform_json(var) 
        end
      } unless json_hash['official'].nil?
      result['source'] = json_hash['source'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['source'].nil?

      result
    end
  end
end
