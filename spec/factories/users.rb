FactoryGirl.define do
  factory :developer, class: User do
    name('Sam')
    email('sammie@cheese.com')
    password("cheeseME")
    linkedin("an account")
    website("A site")
    developer(true)
    employer(false)
  end

  factory :employer, class: User do
    name('Chuck')
    email('chuck@cheese.com')
    password("chuckME-brah")
    linkedin("an account")
    website("A site")
    developer(false)
    employer(true)
  end
end
