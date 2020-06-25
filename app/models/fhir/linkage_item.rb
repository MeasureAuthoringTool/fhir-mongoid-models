module FHIR
  # fhir/linkage_item.rb
  class LinkageItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'LinkageItem'
    embeds_one :type, class_name: 'LinkageType'
    embeds_one :resource, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = LinkageItem.new
      result['type'] = LinkageType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['resource'] = Reference.transform_json(json_hash['resource']) unless json_hash['resource'].nil?      

      result
    end
  end
end
