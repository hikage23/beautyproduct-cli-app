class BeautyProduct::CLI

  def call
    BeautyProduct::Product.products
    BeautyProduct::Product.ingredient
    main_menu
  end # call

  def menu_options
    puts "\nPlease select an option from the menu:"

    puts "1. Search Product by Name"
    puts "2. Search by Ingredient (products that have it)"
    #puts "3. Search by Ingredient (products that do not have it)"
  end # menu_options

  def main_menu
    user_input = nil

    menu_options
    user_input = gets.downcase.strip

    case user_input
    when "1"
      match_product
      return_to_main_menu?
    when "2"
      match_yes_ingredient
      return_to_main_menu?
    when "exit"
      puts "Exiting program. Goodbye!"
      return
    else
      puts "INVALID ENTRY!"
      main_menu
    end # case user_input
  end # main_menu


  def match_product
    user_input = nil
    puts "Enter product name to see its ingredients or type exit:"
    user_input = gets.downcase.strip

    product = BeautyProduct::Product.all.detect { |element| user_input == element.name.downcase }

    if product != nil
      puts ""
      puts "================="
      puts "= Product Found ="
      puts "================="
      puts "#{product.name} - #{product.price}"
      puts "Ingredients include: #{product.ingredients}"
    else
      puts "Product not found. Type 'main menu' or 'exit'"
      main_menu
    end # if not nil
  end # match_product

  def match_yes_ingredient
    user_input = nil
    puts "Enter ingredient name for a list of products or type exit:"
    user_input = gets.downcase.strip

    ingredients = BeautyProduct::Ingredient.all.select { |element| element.name.downcase == user_input }

    if ingredients != nil
      puts ""
      puts "=================="
      puts "= Products Found ="
      puts "=================="
      ingredients.each.with_index(1) do |ingredient, index|
        ingredient.products.each do |product|
          puts ""
          puts "#{index}. #{product.name} - #{product.price}"
          puts "Ingredients include: #{product.ingredients}"
        end # do |product|
      end #do |ingredient|

    else
      puts "Ingredient not found. Type 'main menu' or 'exit'"
    end # if user_input in products
  end # match_yes_ingredient

  def return_to_main_menu?
    puts "\nDo you wish to return to the main menu? (yes/no)"
    puts "Typing 'n', 'no', or 'exit' will quit the program."
    user_input = gets.downcase.strip

    case user_input
    when "y", "yes"
      main_menu
    when "n", "no"
      return
    when "exit"
      return
    else
      "Invalid entry."
      return_to_main_menu?
    end # case user_input
  end # return_to_main_menu?

end # class
