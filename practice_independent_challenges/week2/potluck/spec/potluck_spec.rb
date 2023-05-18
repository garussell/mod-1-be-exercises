require './lib/dish'
require './lib/potluck'

RSpec.describe PotLuck do
  describe "#exists" do
    it "exists" do
      potluck = PotLuck.new("7-13-18")

      expect(potluck).to be_an_instance_of(PotLuck)
      expect(potluck.date).to eq "7-13-18"
      expect(potluck.dishes).to eq []
    end
  end

  describe "#add_dish" do
    it 'can add a dish' do
      potluck = PotLuck.new("7-13-18")
      couscous_salad = Dish.new("Cocktail Meatballs", :entre)
      cocktail_meatballs = Dish.new("Couscous Salad", :appetizer)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)

      expect(potluck.dishes).to eq ([couscous_salad, cocktail_meatballs])
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
   
      expect(potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])
      expect(potluck.get_all_from_category(:appetizer).first).to eq(couscous_salad)
      expect(potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
    end
  end

  describe "#menu" do
    it 'has a sorted menu' do
      potluck = PotLuck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)
      bean_dip = Dish.new("Bean Dip", :appetizer)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)
      potluck.add_dish(bean_dip)

      # expect(potluck.menu).to eq({:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entres=>["Cocktail Meatballs", "Roast Pork"],:desserts=>["Candy Salad"]})

      expected = {
        appetizers: ["Bean Dip", "Couscous Salad", "Summer Pizza"],
        entres: ["Cocktail Meatballs", "Roast Pork"],
        desserts: ["Candy Salad"]
      }

      expect(potluck.menu).to eq expected
    end
  end

  describe "#ratio" do
    it 'can return the ration of a catebory' do
      potluck = PotLuck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)
      bean_dip = Dish.new("Bean Dip", :appetizer)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)
      potluck.add_dish(bean_dip)

      expect(potluck.ratio(:appetizer)).to eq 50.0
    end
  end
end