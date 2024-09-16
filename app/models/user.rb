class User < ApplicationRecord
  # A user (customer) can post many jobs
  has_many :jobs, dependent: :destroy

  # A user (customer) can have many cases with different lawyers
  has_many :cases_as_customer, class_name: 'Case', foreign_key: 'user_id'
  has_many :lawyers, through: :cases_as_customer, source: :lawyer

  # A lawyer (also a user) can handle many cases with different customers
  has_many :cases_as_lawyer, class_name: 'Case', foreign_key: 'lawyer_id'
  has_many :clients, through: :cases_as_lawyer, source: :user

  # Devise setup (for authentication)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
