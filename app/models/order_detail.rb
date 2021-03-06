class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  with_options presence: true do
    validates :order_id
    validates :item_id
    validates :price
    validates :amount
    validates :making_status
  end

  enum making_status: { 製作不可: 1, 製作待ち: 2, 製作中: 3, 製作完了: 4 }
  
end
