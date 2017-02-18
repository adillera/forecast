class Transaction < ApplicationRecord
  belongs_to :user

  def category
    return nil if self.category_id.nil?

    Category.find(self.category_id)
  end
end
