module FHIR
  # fhir/biologically_derived_product_collection.rb
  class BiologicallyDerivedProductCollection < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductCollection'
    embeds_one :collector, class_name: 'Reference'
    embeds_one :source, class_name: 'Reference'
    embeds_one :collectedDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :collectedPeriod, class_name: 'Period'

    def self.transform_json(json_hash, target=BiologicallyDerivedProductCollection.new)
      result = self.superclass.transform_json(json_hash, target)
      result['collector'] = Reference.transform_json(json_hash['collector']) unless json_hash['collector'].nil?      
      result['source'] = Reference.transform_json(json_hash['source']) unless json_hash['source'].nil?      
      result['collectedDateTime'] = PrimitiveDateTime.transform_json(json_hash['collectedDateTime'], json_hash['_collectedDateTime']) unless json_hash['collectedDateTime'].nil?      
      result['collectedPeriod'] = Period.transform_json(json_hash['collectedPeriod']) unless json_hash['collectedPeriod'].nil?      

      result
    end
  end
end
