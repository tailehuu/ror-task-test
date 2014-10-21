class Utility
  def self.create_unique_url(post)
    permalink = '/your_path/' + post.title.parameterize.to_s
    permalink += post.id.to_s unless Post.find_by_permalink(permalink).nil?
    return permalink
  end

  # create check digit
  # - split the string to array
  # - double second digit except
  # - calculate
  # - sum
  # - get valid digit
  # - return number with a valid check digit
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

  # check credit card number
  # - split the string to array
  # - reverse
  # - double second digit except
  # - calculate
  # - sum
  # - get valid digit
  # - compare
  # - return true/false
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
end