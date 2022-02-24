class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :shippings, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :tel, presence: true
  validates :email, presence: true

end
