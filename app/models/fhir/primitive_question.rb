module FHIR
  # fhir/primitive_question.rb
  class PrimitiveQuestion < PrimitiveString
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveQuestion'

    def self.transform_json(json_hash, extension_hash)
      result = PrimitiveQuestion.new
      unless extension_hash.nil?
        result['id'] = extension_hash['id']
        result['extension'] = extension_hash['extension'].map { |ext| Extension.transform_json(ext) }
      end
      result['value'] = json_hash
      result
    end
  end
end
