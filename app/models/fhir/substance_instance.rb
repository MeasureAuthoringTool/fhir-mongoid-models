module FHIR
  # fhir/substance_instance.rb
  class SubstanceInstance < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'
    embeds_one :expiry, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'

    def self.transform_json(json_hash, target = SubstanceInstance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['expiry'] = PrimitiveDateTime.transform_json(json_hash['expiry'], json_hash['_expiry']) unless json_hash['expiry'].nil?      
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      

      result
    end
  end
end
