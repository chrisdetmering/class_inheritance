

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

        puts salary_to_string(bonus)
    end 

    def salary_to_string(salary)
      
        new_salary = salary.to_s.chars.reverse.map
        .with_index {|char, idx| idx % 3 == 0 && idx != 0 ? char + '_' : char}
        .reverse.join("")

        new_salary
    end 


end 

module Subordinatable
     def add_subordinate(employee)
        employee.boss = name
       @subordinates << employee
    end 
end 

class Manager < Employee

    include Subordinatable

    def initialize(name, title, salary)
        super(name, title, salary)
        @subordinates = []
    end

    attr_accessor :subordinates



    def bonus(multiplier)
        bonus =  bonus_calculation * multiplier

       puts salary_to_string(bonus)
    end 


    def bonus_calculation
       
        total_sub_salaries = 0 

        @subordinates.each do |sub| 

           if sub.is_a?(Manager)
                total_sub_salaries += sub.salary + sub.bonus_calculation
           else
                total_sub_salaries += sub.salary
           end
        end 

        total_sub_salaries
    end 

end 

bobby = Employee.new("bobby", "Bitch", 1000000000)
jimmy = Employee.new("jimmy", "Bitch", 12000)


leslie = Manager.new("Leslie", "Hot Lady", 78000)


chris = Manager.new("Chris", "software developer", 1000000)

leslie.add_subordinate(bobby)
leslie.add_subordinate(jimmy)

chris.add_subordinate(leslie)

chris.bonus(4)


