class Bug < ActiveRecord::Base
  enum bug_status: [:new_bug, :in_progress, :closed]
  enum bug_priority: [:minor, :major, :critical]

  has_one :state
  validates_presence_of :state
  validates_associated :state
  validates :app_token, presence: true
  validates :bug_status, presence: true
  validates :bug_priority, presence: true

  before_validation :set_bug_number, on: [:create]
  after_create :set_bug_list_updated_at


  def self.cached_bugs_count(token)
    Rails.cache.fetch("bugs_#{token}", expires_in: 20.seconds) do
      Bug.where(app_token: token).count
    end
  end

  protected
  def set_bug_list_updated_at
    Bug.where(app_token: self.app_token).update_all(bug_list_updated_at: DateTime.now)
  end


  def set_bug_number
    if Bug.exists?(app_token: self.app_token)
      self.bug_number = Bug.where(app_token: self.app_token).last.bug_number + 1
    else
      self.bug_number = 1
    end
  end
end
