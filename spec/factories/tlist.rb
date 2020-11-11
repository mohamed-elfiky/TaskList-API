FactoryBot.define do 
    factory :staic_tlist, class: Tlist do
        name  'list1'
        owner 'mohamed'
    end
    #dynamicaly generated using faker
    factory :random_tlist,  class: Tlist do 
        name  {Faker::TvShows::FamilyGuy.quote}
        owner {Faker::TvShows::FamilyGuy.character}
    end
end