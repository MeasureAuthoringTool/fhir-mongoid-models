module FHIR
  class DosageDoseAndRate < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DosageDoseAndRate'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :doseRange, class_name: 'Range'
    embeds_one :doseSimpleQuantity, class_name: 'SimpleQuantity'
    embeds_one :rateRatio, class_name: 'Ratio'
    embeds_one :rateRange, class_name: 'Range'
    embeds_one :rateSimpleQuantity, class_name: 'SimpleQuantity'
  end
end
