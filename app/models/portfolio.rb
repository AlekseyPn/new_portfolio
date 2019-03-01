# frozen_string_literal: true

class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: ->(attrs) { attrs['name'].blank? }

  include Placeholder

  validates :title, :body, :main_image, :thumb_image, presence: true

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader
  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order('position ASC')
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    # it says for example if main image equal nil, set default url
    self.main_image ||= Placeholder.image_generator(width: '600', height: '400')
    self.thumb_image ||= Placeholder.image_generator(width: '350', height: '200')
  end
end
