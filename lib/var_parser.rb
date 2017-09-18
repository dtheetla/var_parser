require 'var_parser/version'

#
# VarParser module contains methods to extract variables from
# a Ruby script
#
module VarParser
  def self.extract_instance_vars(filepath)
    extract(filepath, '@')
  end
  def self.extract(filepath, sym)
    vars = []
    puts 'Starting Extraction from file ........' + filepath
    File.open(filepath, 'r') do |f|
      f.each_line do |line|
        x = -1
        (0...line.size).each do |ch|
          break if line[ch] == '#'
          if x == -1 && line[ch] == sym
            x = ch
            next
          end
          if  /[A-Za-z0-9_]/.match(line[ch]).nil? && x != -1
            vars.push(line[x...ch])
            x = -1
          end # if @
        end # ch each
      end # each_line
      puts  'Extraction complete'
      vars
    end
  end

end
