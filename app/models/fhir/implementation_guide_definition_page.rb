module FHIR
  # fhir/implementation_guide_definition_page.rb
  class ImplementationGuideDefinitionPage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideDefinitionPage'
    embeds_one :nameurl, class_name: 'PrimitiveUrl'
    embeds_one :nameReference, class_name: 'Reference'
    embeds_one :title, class_name: 'PrimitiveString'
    embeds_one :generation, class_name: 'GuidePageGeneration'
    embeds_many :page, class_name: 'ImplementationGuideDefinitionPage'

    def self.transform_json(json_hash)
      result = ImplementationGuideDefinitionPage.new
      result['nameurl'] = PrimitiveUrl.transform_json(json_hash['nameurl'], json_hash['_nameurl']) unless json_hash['nameurl'].nil?      
      result['nameReference'] = Reference.transform_json(json_hash['nameReference']) unless json_hash['nameReference'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['generation'] = GuidePageGeneration.transform_json(json_hash['generation']) unless json_hash['generation'].nil?      
      result['page'] = json_hash['page'].map { |var| ImplementationGuideDefinitionPage.transform_json(var) } unless json_hash['page'].nil?

      result
    end
  end
end
