module FHIR
  # fhir/contract_content_definition.rb
  class ContractContentDefinition < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractContentDefinition'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :subType, class_name: 'CodeableConcept'
    embeds_one :publisher, class_name: 'Reference'
    embeds_one :publicationDate, class_name: 'PrimitiveDateTime'
    embeds_one :publicationStatus, class_name: 'ContractPublicationStatus'
    embeds_one :copyright, class_name: 'PrimitiveMarkdown'

    def self.transform_json(json_hash)
      result = ContractContentDefinition.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['subType'] = CodeableConcept.transform_json(json_hash['subType']) unless json_hash['subType'].nil?      
      result['publisher'] = Reference.transform_json(json_hash['publisher']) unless json_hash['publisher'].nil?      
      result['publicationDate'] = PrimitiveDateTime.transform_json(json_hash['publicationDate'], json_hash['_publicationDate']) unless json_hash['publicationDate'].nil?      
      result['publicationStatus'] = ContractPublicationStatus.transform_json(json_hash['publicationStatus']) unless json_hash['publicationStatus'].nil?      
      result['copyright'] = PrimitiveMarkdown.transform_json(json_hash['copyright'], json_hash['_copyright']) unless json_hash['copyright'].nil?      

      result
    end
  end
end
