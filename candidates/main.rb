# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here

# binding.pry

puts "Array of candidates at start"

pp @candidates

puts

puts "Candidate search by id"

puts find(5)

puts

puts "All qualified candidates"

pp qualified_candidates(@candidates)

puts

puts "Ordered array of candidates"

ordered_by_qualification(@candidates)

pp @candidates
