# item.rb

class Item
    attr_accessor :name, :description, :price, :quantity
  
    def initialize(name, description, price, quantity)
      @name = name
      @description = description
      @price = price
      @quantity = quantity
  
      # Initialize empty arrays for the 1-to-many relationships
      @reviews = []
      @orders = []
    end
  
    def add_review(review)
      # Add a review to the array of reviews for this item
      @reviews.push(review)
    end
  
    def get_reviews
      # Return an array of all the reviews for this item
      @reviews
    end
  
    def add_order(order)
      # Add an order to the array of orders for this item
      @orders.push(order)
    end
  
    def get_orders
      # Return an array of all the orders for this item
      @orders
    end
  
    def self.find_by_name(items, name)
      # Find the first item in the array of items that has the specified name
      items.find { |item| item.name == name }
    end
  
    def self.filter_by_price_range(items, min_price, max_price)
      # Filter the array of items to only include items with a price within the specified range
      items.select { |item| item.price >= min_price && item.price <= max_price }
    end
  end
  