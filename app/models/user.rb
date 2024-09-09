# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :rememberable
  validates_presence_of %i[name email password]

  # callbacks
  after_create :assign_default_role

  def assign_default_role
    add_role(:member) if roles.blank?
  end
end
