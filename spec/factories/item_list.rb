FactoryBot.define do 
    factory :items_list, class: ListItem do 
        name {Faker::TvShows::FamilyGuy.location}
        description {Faker::Qoute.youda}
        status false
        tlist_id nil
    end
end