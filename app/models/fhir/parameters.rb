module FHIR
  # fhir/parameters.rb
  class Parameters < Resource
    include Mongoid::Document
    field :typeName, type: String, default: 'Parameters'
    embeds_many :parameter, class_name: 'ParametersParameter'

    def self.transform_json(json_hash)
      result = Parameters.new
      result['parameter'] = json_hash['parameter'].map { |var| ParametersParameter.transform_json(var) } unless json_hash['parameter'].nil?

      result
    end
  end
end
