module FHIR
  # fhir/vision_eyes.rb
  class VisionEyes < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'VisionEyes'
    field :value, type: String

    def self.transform_json(json_hash)
      result = VisionEyes.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
