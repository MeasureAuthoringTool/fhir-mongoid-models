module FHIR
  # fhir/implementation_guide_definition.rb
  class ImplementationGuideDefinition < BackboneElement
    include Mongoid::Document
    embeds_many :grouping, class_name: 'FHIR::ImplementationGuideDefinitionGrouping'    
    embeds_many :resource, class_name: 'FHIR::ImplementationGuideDefinitionResource'    
    embeds_one :page, class_name: 'FHIR::ImplementationGuideDefinitionPage'    
    embeds_many :parameter, class_name: 'FHIR::ImplementationGuideDefinitionParameter'    
    embeds_many :template, class_name: 'FHIR::ImplementationGuideDefinitionTemplate'    
    
    def as_json(*args)
      result = super      
      unless self.grouping.nil?  || !self.grouping.any? 
        result['grouping'] = self.grouping.map{ |x| x.as_json(*args) }
      end
      unless self.resource.nil?  || !self.resource.any? 
        result['resource'] = self.resource.map{ |x| x.as_json(*args) }
      end
      unless self.page.nil? 
        result['page'] = self.page.as_json(*args)
      end
      unless self.parameter.nil?  || !self.parameter.any? 
        result['parameter'] = self.parameter.map{ |x| x.as_json(*args) }
      end
      unless self.template.nil?  || !self.template.any? 
        result['template'] = self.template.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImplementationGuideDefinition.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['grouping'] = json_hash['grouping'].map { |var| ImplementationGuideDefinitionGrouping.transform_json(var) } unless json_hash['grouping'].nil?
      result['resource'] = json_hash['resource'].map { |var| ImplementationGuideDefinitionResource.transform_json(var) } unless json_hash['resource'].nil?
      result['page'] = ImplementationGuideDefinitionPage.transform_json(json_hash['page']) unless json_hash['page'].nil?
      result['parameter'] = json_hash['parameter'].map { |var| ImplementationGuideDefinitionParameter.transform_json(var) } unless json_hash['parameter'].nil?
      result['template'] = json_hash['template'].map { |var| ImplementationGuideDefinitionTemplate.transform_json(var) } unless json_hash['template'].nil?

      result
    end
  end
end
