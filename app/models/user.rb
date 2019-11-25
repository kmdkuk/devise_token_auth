# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]
  include DeviseTokenAuth::Concerns::User
  before_validation do
    self.uid = name if uid.blank?
  end
  # 登録時に email を不要にする
  def email_required?
    false
  end
  def email_changed?
    false
  end
end
