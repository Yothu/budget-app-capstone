class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, foreign_key: 'author_id', class_name: 'Group', dependent: :delete_all
  has_many :deals, foreign_key: 'author_id', class_name: 'Deal', dependent: :delete_all

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: 'only allows letters' }

  def categories
    groups
  end
end
