class CombinePriceInLineItem < ActiveRecord::Migration
	def up
		# Add price to line items
		LineItem.all.each do |line_item|
			# get the product price
			price = line_item.product.price
			line_item.price = line_item.quantity * price
			line_item.save!
		end
	end
	def down
		# Remove price from line item
		LineItem.all.each do |line_item|
			# remove price
			line_item.price = nil
			line_item.save!
		end
	end	
end
