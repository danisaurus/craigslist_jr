class Classified < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  after_initialize :init

  def init
    self.date_posted ||= Date.today
  end
end
