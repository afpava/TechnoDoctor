module UserHelper

  def total_feedbacks
      current_user.feedback_ids.count.to_s
  end

  def published_feedbacks
    current_user.feedbacks.published.count.to_s
  end

end
