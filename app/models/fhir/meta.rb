module FHIR
  # fhir/meta.rb
  class Meta < Element
    include Mongoid::Document
    embeds_one :versionId, class_name: 'FHIR::PrimitiveId'
    embeds_one :lastUpdated, class_name: 'FHIR::PrimitiveInstant'
    embeds_one :source, class_name: 'FHIR::PrimitiveUri'
    embeds_many :profile, class_name: 'FHIR::PrimitiveCanonical'
    embeds_many :security, class_name: 'FHIR::Coding'
    embeds_many :tag, class_name: 'FHIR::Coding'

    def self.transform_json(json_hash, target = Meta.new)
      result = self.superclass.transform_json(json_hash, target)
      result['versionId'] = PrimitiveId.transform_json(json_hash['versionId'], json_hash['_versionId']) unless json_hash['versionId'].nil?      
      result['lastUpdated'] = PrimitiveInstant.transform_json(json_hash['lastUpdated'], json_hash['_lastUpdated']) unless json_hash['lastUpdated'].nil?      
      result['source'] = PrimitiveUri.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?      
      result['profile'] = json_hash['profile'].each_with_index.map do |var, i|
        extension_hash = json_hash['_profile'] && json_hash['_profile'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['profile'].nil?
      result['security'] = json_hash['security'].map { |var| Coding.transform_json(var) } unless json_hash['security'].nil?
      result['tag'] = json_hash['tag'].map { |var| Coding.transform_json(var) } unless json_hash['tag'].nil?

      result
    end
  end
end
