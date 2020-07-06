module FHIR
  # fhir/primitive_oid.rb
  class PrimitiveOid < PrimitiveUri
    include Mongoid::Document

    def self.transform_json(json_hash, extension_hash, target = PrimitiveOid.new)
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
