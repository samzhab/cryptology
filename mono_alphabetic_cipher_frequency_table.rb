require 'json'
require 'byebug'

class DecipherMonoAlphabet
  CHARS = ('A'..'Z').freeze
  def start
    cipher_text = File.new('some_text.txt')
    # cipher_text_chars = cipher_text.read.gsub(/[^a-zA-Z]/,'')
    frequency_table = compute_frequency_table(cipher_text)
    puts frequency_table.inspect
  end

  def compute_frequency_table(cipher_text)
    frequency_table = init_frequency_table
    while (line = cipher_text.gets)
      frequency_table = find_frequency(line, frequency_table)
    end
    frequency_table.sort_by { |_char, value| value }.reverse!
  end

  def init_frequency_table
    frequency_table = {}
    CHARS.each do |char|
      frequency_table[:"#{char}"] = 0
    end
    frequency_table
  end

  def find_frequency(line, frequency_table)
    CHARS.each do |char|
      line_frequency = line.count(char.to_s)
      unless line_frequency.zero?
        update_frequency_table(char, line_frequency, frequency_table)
      end
    end
    frequency_table
  end

  def update_frequency_table(char, line_frequency, frequency_table)
    frequency_table[:"#{char}"] += line_frequency
  end
end

dmonal_obj = DecipherMonoAlphabet.new
dmonal_obj.start
