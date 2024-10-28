# frozen_string_literal: true
require "faker"

10.times do |i|
  Task.create(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraphs.join("\n\n"),
    status: Faker::Name.unique.name,
    creator: Faker::Name.unique.name,
    performer: Faker::Name.unique.name,
    completed: Faker::Boolean.boolean,    
  )
end