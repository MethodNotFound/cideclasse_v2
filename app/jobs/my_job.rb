class MyJob < ApplicationJob
  self.queue_adapter = :solid_queue

  def perform()
    puts "uwu"
  end
end
