json.array! @posts do |post|
  json.title post.title
  json.content post.content
  json.id post.id
  json.date post.created_at.strftime("%Y/%m/%d %H:%M")
  json.user post.user.id
  json.name post.user.nickname
  json.user_sign_in current_user
end