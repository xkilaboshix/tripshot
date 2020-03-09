FactoryBot.define do
  
  factory :list do
    title { "ハワイ旅行" }
    body { "ハワイでシュノーケリングをしてきました。" }
    departure_date { "2020/02/20" }
    return_date { "2020/02/24" }
  end
end