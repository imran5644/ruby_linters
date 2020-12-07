class dog
  def initialize(breed, cost)
    @breed = breed
    @cost = cost
  end

  def dog_food(quantity)
    quantity.each do |item|
      puts item
    end

end
