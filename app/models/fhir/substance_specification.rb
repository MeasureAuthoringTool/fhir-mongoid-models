module FHIR
  # fhir/substance_specification.rb
  class SubstanceSpecification < DomainResource
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::CodeableConcept'    
    embeds_one :domain, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :source, class_name: 'FHIR::Reference'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    embeds_many :moiety, class_name: 'FHIR::SubstanceSpecificationMoiety'    
    embeds_many :property, class_name: 'FHIR::SubstanceSpecificationProperty'    
    embeds_one :referenceInformation, class_name: 'FHIR::Reference'    
    embeds_one :structure, class_name: 'FHIR::SubstanceSpecificationStructure'    
    embeds_many :code, class_name: 'FHIR::SubstanceSpecificationCode'    
    embeds_many :name, class_name: 'FHIR::SubstanceSpecificationName'    
    embeds_many :molecularWeight, class_name: 'FHIR::SubstanceSpecificationStructureIsotopeMolecularWeight'    
    embeds_many :relationship, class_name: 'FHIR::SubstanceSpecificationRelationship'    
    embeds_one :nucleicAcid, class_name: 'FHIR::Reference'    
    embeds_one :polymer, class_name: 'FHIR::Reference'    
    embeds_one :protein, class_name: 'FHIR::Reference'    
    embeds_one :sourceMaterial, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.as_json(*args)
      end
      unless self.domain.nil? 
        result['domain'] = self.domain.as_json(*args)
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.source.nil?  || !self.source.any? 
        result['source'] = self.source.map{ |x| x.as_json(*args) }
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      unless self.moiety.nil?  || !self.moiety.any? 
        result['moiety'] = self.moiety.map{ |x| x.as_json(*args) }
      end
      unless self.property.nil?  || !self.property.any? 
        result['property'] = self.property.map{ |x| x.as_json(*args) }
      end
      unless self.referenceInformation.nil? 
        result['referenceInformation'] = self.referenceInformation.as_json(*args)
      end
      unless self.structure.nil? 
        result['structure'] = self.structure.as_json(*args)
      end
      unless self.code.nil?  || !self.code.any? 
        result['code'] = self.code.map{ |x| x.as_json(*args) }
      end
      unless self.name.nil?  || !self.name.any? 
        result['name'] = self.name.map{ |x| x.as_json(*args) }
      end
      unless self.molecularWeight.nil?  || !self.molecularWeight.any? 
        result['molecularWeight'] = self.molecularWeight.map{ |x| x.as_json(*args) }
      end
      unless self.relationship.nil?  || !self.relationship.any? 
        result['relationship'] = self.relationship.map{ |x| x.as_json(*args) }
      end
      unless self.nucleicAcid.nil? 
        result['nucleicAcid'] = self.nucleicAcid.as_json(*args)
      end
      unless self.polymer.nil? 
        result['polymer'] = self.polymer.as_json(*args)
      end
      unless self.protein.nil? 
        result['protein'] = self.protein.as_json(*args)
      end
      unless self.sourceMaterial.nil? 
        result['sourceMaterial'] = self.sourceMaterial.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSpecification.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['domain'] = CodeableConcept.transform_json(json_hash['domain']) unless json_hash['domain'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['source'] = json_hash['source'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['source'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?
      result['moiety'] = json_hash['moiety'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSpecificationMoiety.transform_json(var) 
        end
      } unless json_hash['moiety'].nil?
      result['property'] = json_hash['property'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSpecificationProperty.transform_json(var) 
        end
      } unless json_hash['property'].nil?
      result['referenceInformation'] = Reference.transform_json(json_hash['referenceInformation']) unless json_hash['referenceInformation'].nil?
      result['structure'] = SubstanceSpecificationStructure.transform_json(json_hash['structure']) unless json_hash['structure'].nil?
      result['code'] = json_hash['code'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSpecificationCode.transform_json(var) 
        end
      } unless json_hash['code'].nil?
      result['name'] = json_hash['name'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSpecificationName.transform_json(var) 
        end
      } unless json_hash['name'].nil?
      result['molecularWeight'] = json_hash['molecularWeight'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSpecificationStructureIsotopeMolecularWeight.transform_json(var) 
        end
      } unless json_hash['molecularWeight'].nil?
      result['relationship'] = json_hash['relationship'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSpecificationRelationship.transform_json(var) 
        end
      } unless json_hash['relationship'].nil?
      result['nucleicAcid'] = Reference.transform_json(json_hash['nucleicAcid']) unless json_hash['nucleicAcid'].nil?
      result['polymer'] = Reference.transform_json(json_hash['polymer']) unless json_hash['polymer'].nil?
      result['protein'] = Reference.transform_json(json_hash['protein']) unless json_hash['protein'].nil?
      result['sourceMaterial'] = Reference.transform_json(json_hash['sourceMaterial']) unless json_hash['sourceMaterial'].nil?

      result
    end
  end
end
