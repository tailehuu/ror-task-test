#Ruby Task Test

This repo includes:

  - Check Credit Card function based on Luhn algorithm
  - Add CHECK DIGIT
  - Create Payment model which does not allow **duplicate** line_item_id and service_id

####Requirement:
  
  - Ruby 1.9.3
  - Rails 3.2 

####Installation:

    > bundle install
    > rake db:migration
    > rake db:seed
    > rails s

####Usage:

  - Home page: http://localhost:3000/
  - Payment page: http://localhost:3000/payments

####Q/A:


#####Q: Create Permanent Link

#####A: Find my answer in:

    > /db/migrate/20141020170826_add_permalink_to_post.rb
    > /app/models/utility.rb
    
#####Q: Check Credit Card Number
#####A: Take a look Utility.check_credit_card_number(number)

    def self.check_credit_card_number (number)
        # split the string to array
        numbers = number.to_s.split(//).map { |i| i.to_i }
    
        original = numbers

        # reverse
        numbers = numbers.reverse
    
        # double second digit except
        numbers.each_with_index do |num, index|
          if index % 2 != 0
            numbers[index] = num * 2
          end
        end

        # calculate
        numbers.each_with_index do |num, index|
          if index % 2 != 0
            if num < 10
              numbers[index] = num
            else
              numbers[index] = num/10 + num%10
            end
          end
        end
    
        # sum
        sum = 0
        numbers.each_with_index do |num, index|
          if index != 0
            sum += num
          end
        end
    
        # get valid digit
        valid_digit = 0
        (0..9).each do |i|
          if (i + sum) % 10 == 0
            valid_digit = i
            break
          end
        end
    
        # compare
        return valid_digit == original.last
    end

#####Q: Create check digit
#####A: Take a look Utility.create_check_digit(number)

    def self.create_check_digit (number)
        # split the string to array
        numbers = number.to_s.split(//).map { |i| i.to_i }
    
        puts 'numbers: ' + numbers.to_s
    
        original = number
    
        # double second digit except
        numbers.each_with_index do |num, index|
          if index % 2 != 0
            numbers[index] = num * 2
          end
        end
    
        puts 'double: ' + numbers.to_s
    
        # calculate
        numbers.each_with_index do |num, index|
          if index % 2 != 0
            if num < 10
              numbers[index] = num
            else
              numbers[index] = num/10 + num%10
            end
          end
        end
    
        puts 'calculate: ' + numbers.to_s
    
        # sum
        sum = 0
        numbers.each_with_index do |num, index|
          sum += num
        end
    
        puts 'sum: ' + sum.to_s
    
        # get valid digit
        valid_digit = 0
        (0..9).each do |i|
          if (i + sum) % 10 == 0
            valid_digit = i
            break
          end
        end
    
        puts 'valid_digit: ' + valid_digit.to_s
    
        # return number with a valid check digit
        return original.to_s + valid_digit.to_s
    end

#####Q: Ensure that no duplicate Payment (with the same line_item_id, service_id) objects can exist in our system.
#####A: Please find bellow:

  - Add multi index to Payment model


    class AddIndexToPayment < ActiveRecord::Migration
        def change
            add_index :payments, [:line_item_id, :service_id], :unique => true
        end
    end 
  
  - Add more validations


    class Payment < ActiveRecord::Base
      ...
      validates :service_id, :uniqueness => {:scope => :line_item_id}
      ...
    end


Thanks.
