require "mysql2"
require_relative './Employee'


class TestDb
    attr_reader :client

    def initialize(name_of_DB = "staff")
        @client = Mysql2::Client.new(
            :host => "localhost",
            :username => "root",
            :password => "root"
        )
            @client.query("USE #{name_of_DB}")
    end

    def create_employees_table()
        @client.query <<-SQL
        create table if not exists employees(
            id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
            fio varchar(1024),
            bday_year varchar(1024),
            phone_number varchar(1024),
            address varchar(1024),
            email varchar(1024),
            passport varchar(1024),
            speciality varchar(1024),
            work_exp varchar(1024),
            prev_wp varchar(1024),
            prev_speciality varchar(1024),
            prev_salary varchar(1024))
            SQL
        end

    def del_emps()
        @client.query("drop table employees")
        end

    def show_db()
        @client.query("show databases").to_a(:as => :array).flatten
    end

    def show_tables()
        @client.query("show tables").to_a(:as => :array).flatten
    end

    def insert(values)
        @client.query("insert into employees values (NULL,\'#{values.join("','")}'\)")
    end

    def test_select()
        arr = []
        self.get_records do |record|
            record.values[2][0] = "8"
            record.values[2].delete! "-"
            arr << Employee.new(*record.values)
        end
        return arr
    end

    def get_records()
        for record in @client.query("select * from employees")
            record.delete('id')
            yield record
        end
    end

    def del_record(attr, value)
        @client.query("delete from employees where #{attr.to_s} = '#{value.to_s}'")
    end
end

# db = TestDb.new
# for s in db.test_select
#     p s
#     puts
# end