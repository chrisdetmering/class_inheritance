class Employee

    def initialize(name, title, salary)
        @name = name 
        @title = title 
        @salary = salary
        @boss = nil
    end
    
    attr_accessor :name, :title, :salary, :boss



    def bonus(multiplier)
        bonus = salary * multiplier
    end 


end 

module Subordinatable
     def add_subordinate(employee)
        
       @subordinates << employee
    end 
end 



class Manager < Employee

    include Subordinatable

    def initialize(name, title, salary)
        super(name, title, salary)
        @subordinates = []
    end

    attr_accessor :subordinates, :additional_powers



    def bonus(multiplier)
        bonus =  bonus_calculation * multiplier

        bonus
    end 


    def bonus_calculation
        return salary if subordinates.empty?

        total_sub_salaries = 0 

        @subordinates.each do |sub| 

           if sub.class == Manager 
                total_sub_salaries += sub.bonus_calculation
           else
                total_sub_salaries += sub.salary
           end
        end 

        total_sub_salaries
    end 

end 



leslie = Manager.new("Leslie", "Hot Lady", 10000)


chris = Manager.new("chris", "software developer", 100000)

chris.add_subordinate(leslie)

p chris.bonus(5)


