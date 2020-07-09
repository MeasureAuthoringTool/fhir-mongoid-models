module FHIR
  # fhir/implementation_guide_manifest.rb
  class ImplementationGuideManifest < BackboneElement
    include Mongoid::Document
    embeds_one :rendering, class_name: 'FHIR::PrimitiveUrl'
    embeds_many :resource, class_name: 'FHIR::ImplementationGuideManifestResource'
    embeds_many :page, class_name: 'FHIR::ImplementationGuideManifestPage'
    embeds_many :image, class_name: 'FHIR::PrimitiveString'
    embeds_many :other, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = ImplementationGuideManifest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['rendering'] = PrimitiveUrl.transform_json(json_hash['rendering'], json_hash['_rendering']) unless json_hash['rendering'].nil?      
      result['resource'] = json_hash['resource'].map { |var| ImplementationGuideManifestResource.transform_json(var) } unless json_hash['resource'].nil?
      result['page'] = json_hash['page'].map { |var| ImplementationGuideManifestPage.transform_json(var) } unless json_hash['page'].nil?
      result['image'] = json_hash['image'].each_with_index.map do |var, i|
        extension_hash = json_hash['_image'] && json_hash['_image'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['image'].nil?
      result['other'] = json_hash['other'].each_with_index.map do |var, i|
        extension_hash = json_hash['_other'] && json_hash['_other'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['other'].nil?

      result
    end
  end
end
