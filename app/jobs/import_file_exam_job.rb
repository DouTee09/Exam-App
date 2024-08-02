class ImportFileExamJob
  include Sidekiq::Job

  def perform(content_file)
    content_file.each do |i|
      exam = Exam.new
      exam.name = i["name"]
      exam.time = i["time"]
      exam.subject_id = i["subject_id"]
      exam.questions = JSON.parse(i["questions"]) if i["questions"].present?

      exam.save!
    end
  end
end
