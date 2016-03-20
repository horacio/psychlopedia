class Experience < ActiveRecord::Base
  extend FriendlyId

  has_many :cocktails, dependent: :destroy
  accepts_nested_attributes_for :cocktails, reject_if: :cocktail_is_incomplete?

  friendly_id :title, use: :slugged

  validates :title, :pseudonym, :body, presence: true

  scope :approved, -> { where(approved: true) }

  def approve
    update_attributes(approved: true)
  end

  private

  def cocktail_is_incomplete?(cocktail)
    cocktail[:substance].blank? && cocktail[:dosage].blank?
  end

  # will_paginate per-page limit
  def self.per_page
    15
  end
end
