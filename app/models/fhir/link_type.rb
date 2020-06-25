module FHIR
  # fhir/link_type.rb
  class LinkType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'LinkType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = LinkType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
