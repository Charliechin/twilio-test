# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  assesor                :boolean
#  country_code           :string           default("44")
#  phone_number           :string
#  first_name             :string
#  last_name              :string
#  authy_id               :string
#  verified               :boolean
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 # validates :email, presence: true
  #validates :country_code, presence: true
 # validates :phone_number, presence: true


end
