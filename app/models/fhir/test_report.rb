module FHIR
  # fhir/test_report.rb
  class TestReport < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReport'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :status, class_name: 'TestReportStatus'
    embeds_one :testScript, class_name: 'Reference'
    embeds_one :result, class_name: 'TestReportResult'
    embeds_one :score, class_name: 'PrimitiveDecimal'
    embeds_one :tester, class_name: 'PrimitiveString'
    embeds_one :issued, class_name: 'PrimitiveDateTime'
    embeds_many :participant, class_name: 'TestReportParticipant'
    embeds_one :setup, class_name: 'TestReportSetup'
    embeds_many :test, class_name: 'TestReportTest'
    embeds_one :teardown, class_name: 'TestReportTeardown'

    def self.transform_json(json_hash)
      result = TestReport.new
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['status'] = TestReportStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['testScript'] = Reference.transform_json(json_hash['testScript']) unless json_hash['testScript'].nil?      
      result['result'] = TestReportResult.transform_json(json_hash['result']) unless json_hash['result'].nil?      
      result['score'] = PrimitiveDecimal.transform_json(json_hash['score'], json_hash['_score']) unless json_hash['score'].nil?      
      result['tester'] = PrimitiveString.transform_json(json_hash['tester'], json_hash['_tester']) unless json_hash['tester'].nil?      
      result['issued'] = PrimitiveDateTime.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?      
      result['participant'] = json_hash['participant'].map { |var| TestReportParticipant.transform_json(var) } unless json_hash['participant'].nil?
      result['setup'] = TestReportSetup.transform_json(json_hash['setup']) unless json_hash['setup'].nil?      
      result['test'] = json_hash['test'].map { |var| TestReportTest.transform_json(var) } unless json_hash['test'].nil?
      result['teardown'] = TestReportTeardown.transform_json(json_hash['teardown']) unless json_hash['teardown'].nil?      

      result
    end
  end
end
