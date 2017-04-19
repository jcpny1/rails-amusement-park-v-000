class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  after_initialize :init

  def mood
    if self.nausea > self.happiness
      'sad'
    elsif self.happiness > self.nausea
      'happy'
    end
  end

private

  def init
    self.admin ||= false
  end

end
