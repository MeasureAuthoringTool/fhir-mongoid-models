module FHIR
  # fhir/care_plan_activity_kind.rb
  class CarePlanActivityKind < Element
    include Mongoid::Document
    field :value, type: String

    def self.transform_json(json_hash, target = CarePlanActivityKind.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
