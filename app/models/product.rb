class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true

  validates :price,
            presence: true,
            numericality: { greater_than: 0 }

  validates :stock_quantity,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    [
      "id",
      "name",
      "description",
      "price",
      "stock_quantity",
      "category_id",
      "created_at",
      "updated_at"
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end