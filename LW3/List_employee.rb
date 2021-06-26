require_relative './TestDB'
require_relative './Employee'
require 'json'
require 'psych'

class Hash
    def to_s()
      map {|e| e.join(": ") }.join("\n")
    end
end


class ListEmployee
    def initialize
        @emps = []
        add_from_db
    end

    def add_from_db
        client = TestDb.new
        client.get_records do |rec|
            @emps << rec
        end
    end

    def to_s
        result = ''
        for emp in @emps
            result += emp.to_s
            result += "\n\n"
        end
        return result
    end

    def add(emp)
        # Добавит и в список класса, и в таблицу mysql методом класса add_to_db (своего рода ORM)
        @emps << emp.to_hash
        ListEmployee.add_to_db(emp)
    end

    def self.add_to_db(emp)
        client = TestDb.new
        values = []
        emp.instance_variables.each do |var|
            values << "#{emp.instance_variable_get(var)}"
        end
        client.insert(values)
    end

    def sort_by(param)
        @emps = @emps.sort_by { |k| k[param] }
    end

    def export_as_json()
        File.open("data.json", "w") do |file|
            # чтоб норм выводилось, а не в одну строку
            file.puts(JSON.pretty_generate(@emps))
            # @emps.each { |emp| file.puts(emp.to_json) }
        end
    end

    def import_from_json()
        @emps.clear
        File.open("data.json").each do |e|
            value = JSON.parse(e).values
            value[2][0] = "8"
            value[2].delete! "-"
            @emps << Employee.new(*value)
        end
    end

    def export_as_yaml()
        File.open("data.yaml", "w") do |file|
            file.write(Psych.dump(@emps))
        end
    end
end


lst = ListEmployee.new
puts lst
lst.export_as_json

# lst.import_from_json
# puts lst

# emp1 = Employee.new("Мартиросов Давид Вадимович", 2001, "89186824834", "Краснодар", "martirosov.davidka@mail.ru", "0315312820", "Programmer", 0)
# emp2 = Employee.new("Кушнир Роман Сергеевич", 1999, "89186824834", "Краснодар", "testing@test.com", "0102820123", "Programmer", 0)
# emp3 = Employee.new("Иванов Иван Иванович", 2010, "89181882837", "Москва", "ivanov@ivan.ivanovich", "123456789", "Waiter", 0)
# lst.add(emp1)
# lst.add(emp2)
# lst.add(emp3)
# lst.export_as_json
# puts lst
# puts

# puts "Sorted by fio"
# lst.sort_by("fio")
# puts lst
# puts

# puts "Sorted by address"
# lst.sort_by("address")
# puts lst
# puts

# puts "Sorted by bday_year"
# lst.sort_by("bday_year")
# puts lst
# puts