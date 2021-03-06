module TasksHelper
  def submission_class(submission)
    case submission_status(submission)
    when "Pending"
      "info"
    when "Partial"
      "warning"
    when "Passed"
      "success"
    when "Failed"
      "error"
    end
  end

  def row_class(evaluation)
    case evaluation[:status]
    when "Correct"
      "success"
    else
      "error"
    end
  end

  def submission_status(submission)
    if pending?(submission)
      "Pending"
    elsif submission.completed?
      "Passed"
    elsif submission.partial?
      "Partial"
    else
      "Failed"
    end
  end

  def pending?(submission)
    submission.status == "Pending"
  end

  def evaluation_time(task)
    test_cases = task.test_cases.count
    distance_of_time_in_words(test_cases * task.restrictions["time"])
  end
end
