module FHIR
  # fhir/biologically_derived_product_storage.rb
  class BiologicallyDerivedProductStorage < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :temperature, class_name: 'PrimitiveDecimal'
    embeds_one :scale, class_name: 'BiologicallyDerivedProductStorageScale'
    embeds_one :duration, class_name: 'Period'

    def self.transform_json(json_hash, target = BiologicallyDerivedProductStorage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['temperature'] = PrimitiveDecimal.transform_json(json_hash['temperature'], json_hash['_temperature']) unless json_hash['temperature'].nil?      
      result['scale'] = BiologicallyDerivedProductStorageScale.transform_json(json_hash['scale']) unless json_hash['scale'].nil?      
      result['duration'] = Period.transform_json(json_hash['duration']) unless json_hash['duration'].nil?      

      result
    end
  end
end
