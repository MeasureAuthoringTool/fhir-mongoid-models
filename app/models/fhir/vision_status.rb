module FHIR
  # fhir/vision_status.rb
  class VisionStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'VisionStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = VisionStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
