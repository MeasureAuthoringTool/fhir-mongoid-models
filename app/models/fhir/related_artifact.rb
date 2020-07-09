module FHIR
  # fhir/related_artifact.rb
  class RelatedArtifact < Element
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::RelatedArtifactType'
    embeds_one :label, class_name: 'FHIR::PrimitiveString'
    embeds_one :display, class_name: 'FHIR::PrimitiveString'
    embeds_one :citation, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_one :url, class_name: 'FHIR::PrimitiveUrl'
    embeds_one :document, class_name: 'FHIR::Attachment'
    embeds_one :resource, class_name: 'FHIR::PrimitiveCanonical'

    def self.transform_json(json_hash, target = RelatedArtifact.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = RelatedArtifactType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['label'] = PrimitiveString.transform_json(json_hash['label'], json_hash['_label']) unless json_hash['label'].nil?      
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?      
      result['citation'] = PrimitiveMarkdown.transform_json(json_hash['citation'], json_hash['_citation']) unless json_hash['citation'].nil?      
      result['url'] = PrimitiveUrl.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['document'] = Attachment.transform_json(json_hash['document']) unless json_hash['document'].nil?      
      result['resource'] = PrimitiveCanonical.transform_json(json_hash['resource'], json_hash['_resource']) unless json_hash['resource'].nil?      

      result
    end
  end
end
