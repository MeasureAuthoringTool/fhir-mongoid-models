module FHIR
  # fhir/linkage_item.rb
  class LinkageItem < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'LinkageType'
    embeds_one :resource, class_name: 'Reference'

    def self.transform_json(json_hash, target = LinkageItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = LinkageType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['resource'] = Reference.transform_json(json_hash['resource']) unless json_hash['resource'].nil?      

      result
    end
  end
end
