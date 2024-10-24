class CodeCorrectionJob < ApplicationJob
  self.queue_adapter = :solid_queue

  def perform(submission_id)
    puts "testing #{submission_id}"
    url = ENV.fetch("PISTON_URL") { "http://localhost:2000" }

    submission = Submission.find(submission_id.to_i)
    task = submission.task

    task.tests.each do |test|
      conn = Faraday.new(
        url: url,
        headers: {'Content-Type' => 'application/json'}
      )

      response = conn.post('/api/v2/execute') do |req|
        req.body = {
          language: 'python',
          version: "3.9.4",
          files: [
            {
              "name": "submission.py",
              "content": submission.code
            }
          ],
          stdin: test.input,
          args: [],
          compile_timeout: 5000,
          run_timeout: 3000,
          compile_memory_limit: 1024000000,
          run_memory_limit: 1024000000
        }.to_json
      end

      out = JSON.parse(response.body)["run"]["stdout"]
      out = JSON.parse(response.body)["run"]["stderr"] unless out.present?

      correction = Correction.new(
        test: test,
        submission: submission,
        input: test.input,
        output: out,
        passed: test.output.strip == out.strip
      )

      if correction.save
        p correction
      else
        p corrections.errors
      end
    end

    total_tests = task.tests.size
    passed_tests = submission.corrections.where(passed: true).size
    submission.update(passed: total_tests == passed_tests)
  rescue => e
    puts e.message
    p e.backtrace
  end
end
