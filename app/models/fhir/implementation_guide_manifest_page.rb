module FHIR
  # fhir/implementation_guide_manifest_page.rb
  class ImplementationGuideManifestPage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideManifestPage'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :title, class_name: 'PrimitiveString'
    embeds_many :anchor, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=ImplementationGuideManifestPage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['anchor'] = json_hash['anchor'].each_with_index.map do |var, i|
        extension_hash = json_hash['_anchor'] && json_hash['_anchor'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['anchor'].nil?

      result
    end
  end
end
