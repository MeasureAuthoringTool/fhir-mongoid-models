module FHIR
  # fhir/care_plan_activity_status.rb
  class CarePlanActivityStatus < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = CarePlanActivityStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
