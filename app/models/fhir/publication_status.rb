module FHIR
  # fhir/publication_status.rb
  class PublicationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PublicationStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = PublicationStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
