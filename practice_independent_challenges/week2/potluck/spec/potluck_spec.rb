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

      expect(potluck.dishes).to eq(@dishes)
    end
  end
end