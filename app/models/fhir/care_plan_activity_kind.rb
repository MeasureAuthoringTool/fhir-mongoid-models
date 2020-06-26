module FHIR
  # fhir/care_plan_activity_kind.rb
  class CarePlanActivityKind < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CarePlanActivityKind'
    field :value, type: String

    def self.transform_json(json_hash)
      result = CarePlanActivityKind.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
