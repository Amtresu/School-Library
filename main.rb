require_relative './classes/app'

def main
  app = App.new
  app.entry_point
end

main
