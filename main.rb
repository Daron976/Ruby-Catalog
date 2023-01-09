require_relative 'app'

def entry_point
  puts ''
  puts "Welcome\n"
  app = App.new
  app.select_input
end

entry_point
