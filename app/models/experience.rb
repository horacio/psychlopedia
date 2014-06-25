class Experience < ActiveRecord::Base
  extend FriendlyId

  has_many :cocktails, dependent: :destroy
  accepts_nested_attributes_for :cocktails, reject_if: lambda { |cocktail| cocktail[:substance].blank? && cocktail[:dosage].blank? }

  friendly_id :title, use: :slugged
  is_impressionable

  validates :title, :pseudonym, :body, presence: true

  default_scope { order('created_at DESC') }

  scope :approved, -> { where(is_approved: true) }

  # XXX: a poor's man (and a poor's mind) search engine.
  def self.search(query)
    @results = []
    ["%#{query}", "%#{query}%", "#{query}%"].each do |query|
      ["title", "pseudonym"].each do |field|
        candidates = Experience.approved.where("LOWER(#{field}) LIKE ?", query)
        candidates.each { |candidate| @results << candidate } unless candidates.empty?
      end
    end
    @results.uniq
  end

  # will_paginate per-page limit
  def self.per_page
    15
  end

  def approve
    self.is_approved = true
    save
  end
end
