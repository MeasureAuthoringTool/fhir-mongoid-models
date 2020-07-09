module FHIR
  # fhir/implementation_guide_definition.rb
  class ImplementationGuideDefinition < BackboneElement
    include Mongoid::Document
    embeds_many :grouping, class_name: 'FHIR::ImplementationGuideDefinitionGrouping'
    embeds_many :resource, class_name: 'FHIR::ImplementationGuideDefinitionResource'
    embeds_one :page, class_name: 'FHIR::ImplementationGuideDefinitionPage'
    embeds_many :parameter, class_name: 'FHIR::ImplementationGuideDefinitionParameter'
    embeds_many :template, class_name: 'FHIR::ImplementationGuideDefinitionTemplate'

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
