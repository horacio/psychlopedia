class Experience < ActiveRecord::Base
  validates :body, uniqueness: true, presence: true

  before_save :defaults

  default_scope {order('created_at DESC')}

  def self.random
    order('RANDOM()').first
  end

  def defaults
    self.pseudonym ||= 'anonymous'
    self.title ||= 'untitled experience'
  end
end
