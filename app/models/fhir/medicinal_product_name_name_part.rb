module FHIR
  # fhir/medicinal_product_name_name_part.rb
  class MedicinalProductNameNamePart < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductNameNamePart'
    embeds_one :part, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'Coding'

    def self.transform_json(json_hash, target=MedicinalProductNameNamePart.new)
      result = self.superclass.transform_json(json_hash, target)
      result['part'] = PrimitiveString.transform_json(json_hash['part'], json_hash['_part']) unless json_hash['part'].nil?      
      result['type'] = Coding.transform_json(json_hash['type']) unless json_hash['type'].nil?      

      result
    end
  end
end
