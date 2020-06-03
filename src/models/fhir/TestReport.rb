module FHIR
  class TestReport < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReport'
    embeds_one :identifier, class_name: 'Identifier'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :status, class_name: 'TestReportStatus'
    embeds_one :testScript, class_name: 'Reference'
    embeds_one :result, class_name: 'TestReportResult'
    field :score, type:  # primitive
    embeds_one :_score, class_name: 'Extension'
    field :tester, type:  # primitive
    embeds_one :_tester, class_name: 'Extension'
    field :issued, type:  # primitive
    embeds_one :_issued, class_name: 'Extension'
    embeds_many :participant, class_name: 'TestReportParticipant'
    embeds_one :setup, class_name: 'TestReportSetup'
    embeds_many :test, class_name: 'TestReportTest'
    embeds_one :teardown, class_name: 'TestReportTeardown'
  end
end
