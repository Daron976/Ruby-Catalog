require_relative 'app'

def entry_point
  puts ''
  puts "Welcome\n"
  app = App.new
  app.run
end

entry_point
