class PotLuck
  attr_reader :dishes, :date
  
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.find_all do |dish|
      dish.category == category
    end
  end

  def menu
    appetizer_array = get_all_from_category(:appetizer).map do |dish|
      dish.name
    end
    entre_array = get_all_from_category(:entre).map do |dish|
      dish.name
    end
    desserts_array = get_all_from_category(:dessert).map do |dish|
       dish.name
    end
    {
      appetizers: appetizer_array.sort,
      entres: entre_array.sort,
      desserts: desserts_array.sort
    }
  end

  def ratio(category)
    ((get_all_from_category(category).size.to_f / @dishes.size ) * 100 ).round(1)
  end
end