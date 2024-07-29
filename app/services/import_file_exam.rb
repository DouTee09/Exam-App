class ImportFileExam
  def initialize file
    @file = file
  end

  def import
    spreadsheet = Roo::Spreadsheet.open(@file.path)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      exam = Exam.new
      exam.name = row["name"]
      exam.time = row["time"]
      exam.subject_id = row["subject_id"]
      exam.questions = JSON.parse(row["questions"]) if row["questions"].present?

      exam.save!
    end
  end
end
