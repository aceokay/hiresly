# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

developers = [
  ["Austin Kincaid", "fake1@email.com", "asdasdasd", "https://www.linkedin.com/in/aokincaid", "https://github.com/aceokay", "http://aceokay.github.io/"]
  ["Carlo De Gregorio", "fake2@email.com", "asdasdasd", "https://www.linkedin.com/in/carlodegregorio", "https://github.com/cdg77", "http://cdg77.github.io/portfolio/"]
  ["Jessica Joly", "fake3@email.com", "asdasdasd", "https://www.linkedin.com/in/jessicajoly", "https://github.com/jessicajoly88", "https://github.com/jessicajoly88"]
  ["Alisa Colón", "fake4@email.com", "asdasdasd", "https://www.linkedin.com/in/alisacolon", "https://github.com/alisacodes", "https://github.com/alisacodes"]
  ["Jennifer Bell", "fake5@email.com", "asdasdasd", "https://www.linkedin.com/in/jenleebell", "https://github.com/jenleebell", "https://github.com/jenleebell"]
  ["Jake Glassman", "fake6@email.com", "asdasdasd", "https://www.linkedin.com/in/jakeglassman", "https://github.com/theglassman32", "https://github.com/theglassman32"]
]

developers.each do |name, email, password, linkedin, github, website|
  User.create(name: name, email: email, password: password, linkedin: linkedin, github: github, website: website)
end

employers = [
  []
]
