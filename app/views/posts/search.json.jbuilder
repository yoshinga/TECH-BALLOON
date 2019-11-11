json.array! @posts do |post|
  json.title post.title
  json.content post.content
  json.id post.id
end