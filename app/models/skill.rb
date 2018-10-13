# frozen_string_literal: true

class Skill < ApplicationRecord
  include Placeholder
  validates :title, :percent_utilized, presence: true

  after_initialize :set_defaults

  def set_defaults
    # it says for example if main image equal nil, set default url
    self.badge ||= Placeholder.image_generator(width: '250', height: '250')
  end
end
