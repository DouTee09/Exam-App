class Exam::HomepageController < ExamController
  def index
    @todos = [
      { text: "Do homework", status: 0 },
      { text: "Do something", status: 0 },
    ]
  end
end
