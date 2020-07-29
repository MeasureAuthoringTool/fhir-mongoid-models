module FHIR
  # fhir/type.rb
  class Type
    include Mongoid::Document

    def self.transform_json(json_hash, target = Type.new)
      result = target

      result
    end
  end
end
