class Skill < ActiveRecord::Base
  belongs_to :mentor, class_name: "User", foreign_key: "user_id"
  belongs_to :language
  has_many :feedbacks, -> { order(created_at: :desc) }

  validates_presence_of :mentor, :language, :experience

  def total_feedbacks
    feedbacks.count == 0 ? "none" : feedbacks.count
  end
end