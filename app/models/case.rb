class Case < ApplicationRecord
  # A case belongs to a customer (user) and a lawyer
  belongs_to :user        # This is the customer
  belongs_to :lawyer, class_name: 'User' # This is the lawyer
end
