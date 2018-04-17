
class BeautyProduct::Product

  attr_accessor :name, :brand, :description, :directions, :ingredients_array, :ingredients_string, :price, :url

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end # initialize

  def self.all
    @@all
  end # all

  def self.create_ingredients_array
    self.all.each do |product|
      if !product.ingredients_string.nil?
        product.ingredients_array = product.ingredients_string.split(", ").collect { |ingredient| ingredient.strip }
      end
    end # do |product|
  end # ingredient

  ## Creates an ingredient object for each one and adds this product to its products list
  def self.add_ingredients
    self.all.each do |product|
      if !product.ingredients_array.nil?
        product.ingredients_array.each do |ingredient|
          new_ingredient = BeautyProduct::Ingredient.new(ingredient)
          new_ingredient.products << product
        end # each ingredient
      end # if !nil?
    end # each product
  end # add_ingredient

end # class Product
