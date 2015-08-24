class Request < ActiveRecord::Base
  validates :name, presence: true,
                   length:         {minimum: 1}
  validates :email, presence: true,
                    length:         {minimum: 5}

  after_initialize :set_defaults

  private

  scope :complete, lambda { order(:done) }

  def set_defaults
    # If nil or empty, set it to 0
    self.done ||= 0
  end
end
