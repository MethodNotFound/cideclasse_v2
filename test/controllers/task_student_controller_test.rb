require "test_helper"

class TaskStudentControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get task_student_show_url
    assert_response :success
  end
end
