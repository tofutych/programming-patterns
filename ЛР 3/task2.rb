class TestEmployee
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

    def to_s()
        base = "ФИО: #{@fio}\nГод рождения: #{@bday_year}\nНомер телефона: #{@phone_number}\nАдрес: #{@address}\nEmail: #{@email}\nПаспорт: #{@passport}"

        if @work_exp == 0
            return base + "\nСпециальность: #{@speciality}\n"
        else
            return base + "\nСпециальность и стаж: #{@speciality}, #{@work_exp}\nПредыдущее место работы, специальность, зарплата: #{@prev_wp}, #{@prev_speciality}, #{@prev_salary}\n"
        end
    end
end

Ahmed1 = TestEmployee.new("Ahmedov Ahmed Ahmedovich", 1919, "89188822882", "Rai", "qwe@qwe.xd", "03 03 030 303", "Loh", 0, "Google", "LOH", "123 rublya v god")
Ahmed2 = TestEmployee.new("Ahmedov Ahmed Ahmedovich", 1919, "89188822882", "Rai", "qwe@qwe.xd", "03 03 030 303", "Loh", 1, "Google", "LOH", "123 rublya v god")

puts Ahmed1
puts Ahmed2
