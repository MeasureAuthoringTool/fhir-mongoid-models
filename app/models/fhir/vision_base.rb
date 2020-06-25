module FHIR
  # fhir/vision_base.rb
  class VisionBase < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'VisionBase'
    field :value, type: String

    def self.transform_json(json_hash)
      result = VisionBase.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
