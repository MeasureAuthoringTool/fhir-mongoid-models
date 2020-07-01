module FHIR
  # fhir/age.rb
  class Age < Quantity
    include Mongoid::Document

    def self.transform_json(json_hash, target = Age.new)
      result = self.superclass.transform_json(json_hash, target)

      result
    end
  end
end
