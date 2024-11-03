require 'csv'
require 'date'

namespace :hexlet do
  task :import_users, [:file] => :environment do |t, args|
    file = args[:file]
    print "Loading the data from #{file}"
    users = CSV.read(file)
    i = 0
    users.each do |row|
      i += 1
      next if i == 1
      User.create!(
        first_name: row[0], 
        last_name: row[1], 
        birthday: Date.new(row[2].split("/")[2].to_i, row[2].split("/")[0].to_i, row[2].split("/")[1].to_i), 
        email: row[3]
      )
    end
    print "\n...done\n"
  end
end
