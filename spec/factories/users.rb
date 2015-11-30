FactoryGirl.define do
  factory :developer, class: User do
    name('Sam')
    email('sammie@cheese.com')
    password("cheeseME")
    developer(true)
    employer(false)
  end

  factory :employer, class: User do
    name('Chuck')
    email('chuck@cheese.com')
    password("chuckME-brah")
    developer(false)
    employer(true)

    # factory :employer_with_problems do
    #   transient do
    #     problem_count 1
    #   end
    #   after(:create) do |user|
    #     user.problems << FactoryGirl.build(:problem, user: user)
    #     # create_list(:problem, evaluator.problem_count, user: user)
    #   end
    # end
  end
end
