module FHIR
  # fhir/substance_source_material.rb
  class SubstanceSourceMaterial < DomainResource
    include Mongoid::Document
    embeds_one :sourceMaterialClass, class_name: 'FHIR::CodeableConcept'    
    embeds_one :sourceMaterialType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :sourceMaterialState, class_name: 'FHIR::CodeableConcept'    
    embeds_one :organismId, class_name: 'FHIR::Identifier'    
    embeds_one :organismName, class_name: 'FHIR::PrimitiveString'    
    embeds_many :parentSubstanceId, class_name: 'FHIR::Identifier'    
    embeds_many :parentSubstanceName, class_name: 'FHIR::PrimitiveString'    
    embeds_many :countryOfOrigin, class_name: 'FHIR::CodeableConcept'    
    embeds_many :geographicalLocation, class_name: 'FHIR::PrimitiveString'    
    embeds_one :developmentStage, class_name: 'FHIR::CodeableConcept'    
    embeds_many :fractionDescription, class_name: 'FHIR::SubstanceSourceMaterialFractionDescription'    
    embeds_one :organism, class_name: 'FHIR::SubstanceSourceMaterialOrganism'    
    embeds_many :partDescription, class_name: 'FHIR::SubstanceSourceMaterialPartDescription'    
    
    def as_json(*args)
      result = super      
      unless self.sourceMaterialClass.nil? 
        result['sourceMaterialClass'] = self.sourceMaterialClass.as_json(*args)
      end
      unless self.sourceMaterialType.nil? 
        result['sourceMaterialType'] = self.sourceMaterialType.as_json(*args)
      end
      unless self.sourceMaterialState.nil? 
        result['sourceMaterialState'] = self.sourceMaterialState.as_json(*args)
      end
      unless self.organismId.nil? 
        result['organismId'] = self.organismId.as_json(*args)
      end
      unless self.organismName.nil? 
        result['organismName'] = self.organismName.value
        serialized = Extension.serializePrimitiveExtension(self.organismName)            
        result['_organismName'] = serialized unless serialized.nil?
      end
      unless self.parentSubstanceId.nil?  || !self.parentSubstanceId.any? 
        result['parentSubstanceId'] = self.parentSubstanceId.map{ |x| x.as_json(*args) }
      end
      unless self.parentSubstanceName.nil?  || !self.parentSubstanceName.any? 
        result['parentSubstanceName'] = self.parentSubstanceName.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.parentSubstanceName)                              
        result['_parentSubstanceName'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.countryOfOrigin.nil?  || !self.countryOfOrigin.any? 
        result['countryOfOrigin'] = self.countryOfOrigin.map{ |x| x.as_json(*args) }
      end
      unless self.geographicalLocation.nil?  || !self.geographicalLocation.any? 
        result['geographicalLocation'] = self.geographicalLocation.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.geographicalLocation)                              
        result['_geographicalLocation'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.developmentStage.nil? 
        result['developmentStage'] = self.developmentStage.as_json(*args)
      end
      unless self.fractionDescription.nil?  || !self.fractionDescription.any? 
        result['fractionDescription'] = self.fractionDescription.map{ |x| x.as_json(*args) }
      end
      unless self.organism.nil? 
        result['organism'] = self.organism.as_json(*args)
      end
      unless self.partDescription.nil?  || !self.partDescription.any? 
        result['partDescription'] = self.partDescription.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSourceMaterial.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sourceMaterialClass'] = CodeableConcept.transform_json(json_hash['sourceMaterialClass']) unless json_hash['sourceMaterialClass'].nil?
      result['sourceMaterialType'] = CodeableConcept.transform_json(json_hash['sourceMaterialType']) unless json_hash['sourceMaterialType'].nil?
      result['sourceMaterialState'] = CodeableConcept.transform_json(json_hash['sourceMaterialState']) unless json_hash['sourceMaterialState'].nil?
      result['organismId'] = Identifier.transform_json(json_hash['organismId']) unless json_hash['organismId'].nil?
      result['organismName'] = PrimitiveString.transform_json(json_hash['organismName'], json_hash['_organismName']) unless json_hash['organismName'].nil?
      result['parentSubstanceId'] = json_hash['parentSubstanceId'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['parentSubstanceId'].nil?
      result['parentSubstanceName'] = json_hash['parentSubstanceName'].each_with_index.map do |var, i|
        extension_hash = json_hash['_parentSubstanceName'] && json_hash['_parentSubstanceName'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['parentSubstanceName'].nil?
      result['countryOfOrigin'] = json_hash['countryOfOrigin'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['countryOfOrigin'].nil?
      result['geographicalLocation'] = json_hash['geographicalLocation'].each_with_index.map do |var, i|
        extension_hash = json_hash['_geographicalLocation'] && json_hash['_geographicalLocation'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['geographicalLocation'].nil?
      result['developmentStage'] = CodeableConcept.transform_json(json_hash['developmentStage']) unless json_hash['developmentStage'].nil?
      result['fractionDescription'] = json_hash['fractionDescription'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSourceMaterialFractionDescription.transform_json(var) 
        end
      } unless json_hash['fractionDescription'].nil?
      result['organism'] = SubstanceSourceMaterialOrganism.transform_json(json_hash['organism']) unless json_hash['organism'].nil?
      result['partDescription'] = json_hash['partDescription'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSourceMaterialPartDescription.transform_json(var) 
        end
      } unless json_hash['partDescription'].nil?

      result
    end
  end
end
