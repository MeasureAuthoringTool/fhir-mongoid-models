module FHIR
  # fhir/media_status.rb
  class MediaStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MediaStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = MediaStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
