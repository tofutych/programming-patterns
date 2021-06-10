class Employee
    attr_accessor :fio, :bday_year, :phone_number, :address, :email, :passport, :speciality, :work_exp, :prev_wp, :prev_speciality, :prev_salary

    def initialize(fio, bday_year, phone_number, address, email, passport, speciality, work_exp, prev_wp = nil, prev_speciality = nil, prev_salary = nil)
        self.fio= fio
        self.bday_year= bday_year
        self.phone_number= phone_number
        self.address= address
        self.email= email
        self.passport= passport
        self.speciality= speciality
        self.work_exp= work_exp
        if work_exp == 0
            self.prev_wp= nil
            self.prev_speciality= nil
            self.prev_salary= nil
        else
            self.prev_wp= prev_wp
            self.prev_speciality= prev_speciality
            self.prev_salary= prev_salary
        end
    end

    def to_s
        s = ""
        self.instance_variables.each do |var|
            if self.instance_variable_get(var) != nil
                s +=  "#{var.to_s.delete("@").capitalize}: #{self.instance_variable_get(var).inspect}\n"
            else
                next
            end
        end
        s
    end
end


emp1 = Employee.new("Ivanov Ivan Ivanovich", 2000, "89001234567", "Ulitsya Pushkina Dom Kolotushkina", "ivanov@ivan.ivanovich", "12 34 567890", "Waiter", 0)
emp2 = Employee.new("Ivanov Ivan Ivanovich", 2000, "89001234567", "Ulitsya Pushkina Dom Kolotushkina", "ivanov@ivan.ivanovich", "12 34 567890", "Waiter", 5, "Moscow", "Janitor", 10000)
puts emp1
puts
puts emp2