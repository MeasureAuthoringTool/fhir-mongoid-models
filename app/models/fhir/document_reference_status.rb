module FHIR
  # fhir/document_reference_status.rb
  class DocumentReferenceStatus < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = DocumentReferenceStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
