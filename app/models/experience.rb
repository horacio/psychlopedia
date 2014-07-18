class Experience < ActiveRecord::Base
  extend FriendlyId

  has_many :cocktails, dependent: :destroy
  accepts_nested_attributes_for :cocktails, reject_if: :cocktail_is_incomplete?

  friendly_id :title, use: :slugged

  validates :title, :pseudonym, :body, presence: true

  default_scope { order('created_at DESC') }

  scope :approved, -> { where(is_approved: true) }
  scope :field_like, -> (field, query) { where("LOWER(#{field}) LIKE ?", "%#{query}%") }

  def self.search(query)
    @results = %w(pseudonym title body).flat_map do |field|
      Experience.approved.field_like(field, query)
    end.uniq
  end

  # will_paginate per-page limit
  def self.per_page
    15
  end

  def approve
    self.is_approved = true
    save
  end

  def cocktail_is_incomplete?(cocktail)
    cocktail[:substance].blank? && cocktail[:dosage].blank?
  end
end
