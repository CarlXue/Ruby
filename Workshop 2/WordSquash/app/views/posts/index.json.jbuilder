json.array!(@posts) do |post|
  json.extract! post, :id, :post_content, :title, :pub_date
  json.url post_url(post, format: :json)
end
