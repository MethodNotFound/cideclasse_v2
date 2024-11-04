class KlassReportJob < ApplicationJob
  self.queue_adapter = :solid_queue

  def perform(klass_id)
    klass = Klass.find(klass_id)
    students = klass.students

    report = Report.create(klass: klass, finished: false)

    compares = []

    klass.tasks.each do |task|
      students.each do |student|
        compares << student.submissions.where(task: task, passed: true).limit(1).last
      end
    end

    p compares

    folder_name = SecureRandom.base36(10)
    Dir.mkdir "#{Rails.root.to_s}/tmp/#{folder_name}"
    compares.each do |com|
      File.open("#{Rails.root.to_s}/tmp/#{folder_name}/#{com.student.name}_#{com.task.title}.py", "w") do |f|
        f.write(com.code)
      end
    end

    cmd = "cd #{Rails.root.to_s}/tmp/#{folder_name} && java -jar #{Rails.root.to_s}/bin/jplag.jar -l python3 #{Rails.root.to_s}/tmp/#{folder_name}"

    puts cmd
    `#{cmd}`

    report.result.attach(io: File.open("#{Rails.root.to_s}/tmp/#{folder_name}/results.zip"), filename: "results.zip")
    report.update(finished: true)
  rescue => e
    puts e.message
    p e.backtrace
  end
end
