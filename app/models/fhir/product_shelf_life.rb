module FHIR
  # fhir/product_shelf_life.rb
  class ProductShelfLife < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Quantity'
    embeds_many :specialPrecautionsForStorage, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target = ProductShelfLife.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['period'] = Quantity.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['specialPrecautionsForStorage'] = json_hash['specialPrecautionsForStorage'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['specialPrecautionsForStorage'].nil?

      result
    end
  end
end
