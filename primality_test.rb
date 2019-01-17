require 'byebug'
require 'number-theory'
include NumberTheory

class PrimalityTest
  def get_congruency_list(witness, power_to_raise, number)
    power_to_raise_out = 1
    response = []
    congruency_list = []
    loop do
      powered_value = ((witness**power_to_raise)**power_to_raise_out)
      congruent_to = ((witness**power_to_raise)**power_to_raise_out) % number
      power_to_raise_out **= 2 if power_to_raise_out != 1
      power_to_raise_out = 2 if power_to_raise_out == 1
      congruency_list << powered_value
      congruency_list << congruent_to
      return congruency_list if congruent_to == 1
    end
  end

  def rabin_miller_primality_test(number, witness)
    n_minus_1 = number - 1
    factors_of_n_minus_1 = Primes.factor(n_minus_1)
    power_of_2 = 0
    power_to_raise = 1
    factors_of_n_minus_1.each do |factors|
      if factors.first == 2
        power_of_2 = factors.last
      else
        power_to_raise *= factors.first * factors.last
      end
    end
    congruency_list = get_congruency_list(witness, power_to_raise, number)
    congruent_to = congruency_list.pop
    powered_value = congruency_list.pop
    factorization_congruent_to = congruency_list.pop
    factorization_powered_value = congruency_list.pop
    if congruent_to_negative_one?(factorization_congruent_to, number)
      puts "#{number} maybe prime, and #{witness} is its witness"
    else
      factors = factor_composite_number(factorization_congruent_to, number)
      puts "#{number} is composite and its factors are #{factors.first} and" \
           " #{factors.last}"
    end
  end

  def factor_composite_number(to_factor, number)
    factors = []
    factors << (to_factor - 1).gcd(number)
    factors << (to_factor + 1).gcd(number)
    factors
  end

  def congruent_to_negative_one?(congruent_to, number)
    -1 % number == congruent_to
  end

  def start
    puts '[Assignment 11.1 Uni-Bonn >>>>> Rabin-Miller Primality Test]'
    puts 'Runing Rabin-Miller Primality Test for N = 41 and a = 2'
    sleep 3
    rabin_miller_primality_test(41, 2)
    sleep 1

    puts 'Runing Rabin-Miller Primality Test for N = 57 and a = 37'
    sleep 3
    rabin_miller_primality_test(57, 37)
    sleep 1

    puts 'Runing Rabin-Miller Primality Test for N = 1105 and a = 47'
    sleep 3
    rabin_miller_primality_test(1105, 47)
    sleep 1

    puts 'Runing Rabin-Miller Primality Test for N = 1105 and a = 2'
    sleep 3
    rabin_miller_primality_test(1105, 2)
    sleep 1
  end
end

test_prime = PrimalityTest.new
test_prime.start
