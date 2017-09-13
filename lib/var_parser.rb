require "var_parser/version"

module VarParser
  
  def self.extract_instance_vars(filepath)    
    puts 'Starting Extraction from file ........'+ARGF.filename
    vars = []
    File.open(filepath, "r") do |f|
      f.each_line do |line|
        x=-1
        print '..'
        (0...line.size).each do |ch|
          break if line[ch] == '#'
          if x == -1 && line[ch] == '@'
            x = ch
            next
          end
          if  /[A-Za-z0-9_]/.match(line[ch]).nil?  && x!=-1
            vars.push(line[x...ch])
            x = -1
          end #if @
        end #ch each
      end # each_line
    end
    puts ''
    puts  'Extraction complete'
    puts vars.uniq.inspect
    return vars
  end
  
end
