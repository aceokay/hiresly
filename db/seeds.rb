# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

employers = [
  ["Susanne Vigh", "fake7@email.com", "asdasdasd", "https://www.linkedin.com/in/aokincaid", "https://github.com/aceokay", "http://aceokay.github.io/"],
  ["Adessa Kast", "fake8@email.com", "asdasdasd", "https://www.linkedin.com/in/aokincaid", "https://github.com/aceokay", "http://aceokay.github.io/"],
  ["Jadwa Sbait", "fake9@email.com", "asdasdasd", "https://www.linkedin.com/in/aokincaid", "https://github.com/aceokay", "http://aceokay.github.io/"],
  ["Anna Sky", "fake10@email.com", "asdasdasd", "https://www.linkedin.com/in/aokincaid", "https://github.com/aceokay", "http://aceokay.github.io/"],
  ["Kaiti Riter", "fake11@email.com", "asdasdasd", "https://www.linkedin.com/in/aokincaid", "https://github.com/aceokay", "http://aceokay.github.io/"],
  ["Kayli Gentry", "fake11@email.com", "asdasdasd", "https://www.linkedin.com/in/aokincaid", "https://github.com/aceokay", "http://aceokay.github.io/"]
]

problems = [
  ["Palindrome", "Write code to check a String is palindrome or not."],
  ["Remove Char", "Write a method which will remove any given character from a String."],
  ["Anagram", "How to check if two String are Anagram"]
]

employers.each do |name, email, password, linkedin, github, website|
  user = User.create(name: name, email: email, password: password, linkedin: linkedin, github: github, website: website, developer: false, employer: true)
  if user.save
    problems.each do |title, body|
      user.problems.create(title: title, body: body, difficulty: 1)
    end
  end
end

developers = [
  ["Austin Kincaid", "fake1@email.com", "asdasdasd", "https://www.linkedin.com/in/aokincaid", "https://github.com/aceokay", "http://aceokay.github.io/"],
  ["Carlo De Gregorio", "fake2@email.com", "asdasdasd", "https://www.linkedin.com/in/carlodegregorio", "https://github.com/cdg77", "http://cdg77.github.io/portfolio/"],
  ["Jessica Joly", "fake3@email.com", "asdasdasd", "https://www.linkedin.com/in/jessicajoly", "https://github.com/jessicajoly88", "https://github.com/jessicajoly88"],
  ["Alisa Colón", "fake4@email.com", "asdasdasd", "https://www.linkedin.com/in/alisacolon", "https://github.com/alisacodes", "https://github.com/alisacodes"],
  ["Jennifer Bell", "fake5@email.com", "asdasdasd", "https://www.linkedin.com/in/jenleebell", "https://github.com/jenleebell", "https://github.com/jenleebell"],
  ["Jake Glassman", "fake6@email.com", "asdasdasd", "https://www.linkedin.com/in/jakeglassman", "https://github.com/theglassman32", "https://github.com/theglassman32"]
]

developers.each do |name, email, password, linkedin, github, website|
  user = User.create(name: name, email: email, password: password, linkedin: linkedin, github: github, website: website, developer: true, employer: false)
  if user.save
    user.requests.create(user_id: user.id, problem_id: User.where({employer: true}).first.problems.last.id)
    user.tests.create(problem_id: User.where({employer: true}).first.problems.first.id, video_url: "https://www.youtube.com/watch?v=vT_dDd3HCvA", github_url: "https://github.com/AllenDowney/thinkjavasolutions5/blob/master/chap07/Palindrome.java", answer_text: "I went about it in a novel manner. Written in Java.")
  end
end
