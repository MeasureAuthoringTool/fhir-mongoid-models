module FHIR
  # fhir/medicinal_product_packaged_batch_identifier.rb
  class MedicinalProductPackagedBatchIdentifier < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPackagedBatchIdentifier'
    embeds_one :outerPackaging, class_name: 'Identifier'
    embeds_one :immediatePackaging, class_name: 'Identifier'

    def self.transform_json(json_hash)
      result = MedicinalProductPackagedBatchIdentifier.new
      result['outerPackaging'] = Identifier.transform_json(json_hash['outerPackaging']) unless json_hash['outerPackaging'].nil?      
      result['immediatePackaging'] = Identifier.transform_json(json_hash['immediatePackaging']) unless json_hash['immediatePackaging'].nil?      

      result
    end
  end
end
