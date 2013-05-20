class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value, :user
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  after_save :sum_karma_points

  def sum_karma_points
    user.update_attributes(karma_sum: user.karma_sum + value)
  end

end
