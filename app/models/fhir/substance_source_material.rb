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

    def self.transform_json(json_hash, target = SubstanceSourceMaterial.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sourceMaterialClass'] = CodeableConcept.transform_json(json_hash['sourceMaterialClass']) unless json_hash['sourceMaterialClass'].nil?
      result['sourceMaterialType'] = CodeableConcept.transform_json(json_hash['sourceMaterialType']) unless json_hash['sourceMaterialType'].nil?
      result['sourceMaterialState'] = CodeableConcept.transform_json(json_hash['sourceMaterialState']) unless json_hash['sourceMaterialState'].nil?
      result['organismId'] = Identifier.transform_json(json_hash['organismId']) unless json_hash['organismId'].nil?
      result['organismName'] = PrimitiveString.transform_json(json_hash['organismName'], json_hash['_organismName']) unless json_hash['organismName'].nil?
      result['parentSubstanceId'] = json_hash['parentSubstanceId'].map { |var| Identifier.transform_json(var) } unless json_hash['parentSubstanceId'].nil?
      result['parentSubstanceName'] = json_hash['parentSubstanceName'].each_with_index.map do |var, i|
        extension_hash = json_hash['_parentSubstanceName'] && json_hash['_parentSubstanceName'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['parentSubstanceName'].nil?
      result['countryOfOrigin'] = json_hash['countryOfOrigin'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['countryOfOrigin'].nil?
      result['geographicalLocation'] = json_hash['geographicalLocation'].each_with_index.map do |var, i|
        extension_hash = json_hash['_geographicalLocation'] && json_hash['_geographicalLocation'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['geographicalLocation'].nil?
      result['developmentStage'] = CodeableConcept.transform_json(json_hash['developmentStage']) unless json_hash['developmentStage'].nil?
      result['fractionDescription'] = json_hash['fractionDescription'].map { |var| SubstanceSourceMaterialFractionDescription.transform_json(var) } unless json_hash['fractionDescription'].nil?
      result['organism'] = SubstanceSourceMaterialOrganism.transform_json(json_hash['organism']) unless json_hash['organism'].nil?
      result['partDescription'] = json_hash['partDescription'].map { |var| SubstanceSourceMaterialPartDescription.transform_json(var) } unless json_hash['partDescription'].nil?

      result
    end
  end
end
