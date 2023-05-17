require './lib/dish'
require './lib/potluck'

RSpec.describe PotLuck do
  describe "#exists" do
    it "exists" do
      potluck = PotLuck.new("7-13-18")

      expect(potluck).to be_an_instance_of(PotLuck)
    end
  end

  describe "#add_dish" do
    it 'can add a dish' do
      potluck = PotLuck.new("7-13-18")
      couscous_salad = Dish.new("Cocktail Meatballs", :entre)
      cocktail_meatballs = Dish.new("Couscous Salad", :appetizer)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)
      expect(potluck.dishes)
      expect(potluck.dishes.length).to eq(2)
    end
  end

  describe "#get_all_from_category" do
    it 'can search by category' do
      potluck = PotLuck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)
      
      expect(potluck.get_all_from_category(:appetizer)).to eq([summer_pizza, couscous_salad])
    end
  end
end