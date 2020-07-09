module FHIR
  # fhir/molecular_sequence_repository.rb
  class MolecularSequenceRepository < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::RepositoryType'
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :datasetId, class_name: 'FHIR::PrimitiveString'
    embeds_one :variantsetId, class_name: 'FHIR::PrimitiveString'
    embeds_one :readsetId, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = MolecularSequenceRepository.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = RepositoryType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['datasetId'] = PrimitiveString.transform_json(json_hash['datasetId'], json_hash['_datasetId']) unless json_hash['datasetId'].nil?      
      result['variantsetId'] = PrimitiveString.transform_json(json_hash['variantsetId'], json_hash['_variantsetId']) unless json_hash['variantsetId'].nil?      
      result['readsetId'] = PrimitiveString.transform_json(json_hash['readsetId'], json_hash['_readsetId']) unless json_hash['readsetId'].nil?      

      result
    end
  end
end
