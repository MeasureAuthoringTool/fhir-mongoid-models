module FHIR
  # fhir/resource.rb
  class Resource
    include Mongoid::Document
    field :typeName, type: String, default: 'Resource'
    field :id, type: String
    embeds_one :meta, class_name: 'Meta'
    embeds_one :implicitRules, class_name: 'PrimitiveUri'
    embeds_one :language, class_name: 'PrimitiveCode'
    field :resourceType, type: String

    def self.transform_json(json_hash, target=Resource.new)
      result = target
      result['id'] = json_hash['id'] unless json_hash['id'].nil?
      result['meta'] = Meta.transform_json(json_hash['meta']) unless json_hash['meta'].nil?      
      result['implicitRules'] = PrimitiveUri.transform_json(json_hash['implicitRules'], json_hash['_implicitRules']) unless json_hash['implicitRules'].nil?      
      result['language'] = PrimitiveCode.transform_json(json_hash['language'], json_hash['_language']) unless json_hash['language'].nil?      
      result['resourceType'] = json_hash['resourceType'] unless json_hash['resourceType'].nil?

      result
    end
  end
end
