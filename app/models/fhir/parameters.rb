module FHIR
  # fhir/parameters.rb
  class Parameters < Resource
    include Mongoid::Document
    embeds_many :parameter, class_name: 'ParametersParameter'

    def self.transform_json(json_hash, target = Parameters.new)
      result = self.superclass.transform_json(json_hash, target)
      result['parameter'] = json_hash['parameter'].map { |var| ParametersParameter.transform_json(var) } unless json_hash['parameter'].nil?

      result
    end
  end
end
