module FHIR
  # fhir/element_definition_slicing_discriminator.rb
  class ElementDefinitionSlicingDiscriminator < Element
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::DiscriminatorType'
    embeds_one :path, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = ElementDefinitionSlicingDiscriminator.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = DiscriminatorType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?      

      result
    end
  end
end
