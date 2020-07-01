module FHIR
  # fhir/count.rb
  class Count < Quantity
    include Mongoid::Document

    def self.transform_json(json_hash, target = Count.new)
      result = self.superclass.transform_json(json_hash, target)

      result
    end
  end
end
