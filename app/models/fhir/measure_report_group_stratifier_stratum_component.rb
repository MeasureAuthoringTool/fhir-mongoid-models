module FHIR
  # fhir/measure_report_group_stratifier_stratum_component.rb
  class MeasureReportGroupStratifierStratumComponent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureReportGroupStratifierStratumComponent'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :value, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target=MeasureReportGroupStratifierStratumComponent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['value'] = CodeableConcept.transform_json(json_hash['value']) unless json_hash['value'].nil?      

      result
    end
  end
end
