module FHIR
  # fhir/biologically_derived_product_collection.rb
  class BiologicallyDerivedProductCollection < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductCollection'
    embeds_one :collector, class_name: 'Reference'
    embeds_one :source, class_name: 'Reference'
    embeds_one :collecteddateTime, class_name: 'PrimitiveDateTime'
    embeds_one :collectedPeriod, class_name: 'Period'

    def self.transform_json(json_hash)
      result = BiologicallyDerivedProductCollection.new
      result['collector'] = Reference.transform_json(json_hash['collector']) unless json_hash['collector'].nil?      
      result['source'] = Reference.transform_json(json_hash['source']) unless json_hash['source'].nil?      
      result['collecteddateTime'] = PrimitiveDateTime.transform_json(json_hash['collecteddateTime'], json_hash['_collecteddateTime']) unless json_hash['collecteddateTime'].nil?      
      result['collectedPeriod'] = Period.transform_json(json_hash['collectedPeriod']) unless json_hash['collectedPeriod'].nil?      

      result
    end
  end
end
