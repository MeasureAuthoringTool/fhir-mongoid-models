module FHIR
  # fhir/contributor.rb
  class Contributor < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Contributor'
    embeds_one :type, class_name: 'ContributorType'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_many :contact, class_name: 'ContactDetail'

    def self.transform_json(json_hash)
      result = Contributor.new
      result['type'] = ContributorType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?

      result
    end
  end
end
