# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  # callbacks
  after_create :assign_default_role

  def assign_default_role
    add_role(:member) if roles.blank?
  end
end
