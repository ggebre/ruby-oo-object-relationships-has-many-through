class Waiter
    @@all = []
    attr_accessor :name, :years
   def initialize (name, years)
        @name = name
        @years = years
        save
   end

   def save
        @@all << self
   end

   def new_meal (customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals 
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
    #    select the meal with the largest tip
    #  return the customer associated with this meal
        meals.max {|meal1, meal2| meal1.tip <=> meal2.tip }.customer
    end
   def self.all
        @@all
   end
end