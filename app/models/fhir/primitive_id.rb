module FHIR
  # fhir/primitive_id.rb
  class PrimitiveId < PrimitiveString
    include Mongoid::Document

    def self.transform_json(json_hash, extension_hash, target = PrimitiveId.new)
      result = target
      unless extension_hash.nil?
        result['id'] = extension_hash['id']
        result['extension'] = extension_hash['extension'].map { |ext| Extension.transform_json(ext) }
      end
      result['value'] = json_hash
      result
    end
  end
end
