require 'test_helper'

class CartTest < ActiveSupport::TestCase
# Add unit tests that add unique products and duplicate products. Note
# that you will need to modify the fi

  fixtures :products, :carts
  test "add unique products into cart" do
    cart = carts(:one)
    cart.add_product(products(:ruby).id)
    cart.line_items.each do |line_item|
    	assert_equal 1, line_item.quantity
    end
  end

  test "add duplicate products into cart" do
    cart = carts(:two)
    cart.add_product(products(:ruby).id).save
    cart.add_product(products(:ruby).id).save
    cart.line_items.each do |line_item|
    	assert_equal 2, line_item.quantity
    end
  end
end
