5.times do |user_index|
  user = User.create(
    name:     "Name - #{user_index.next}",
    password: "Password - #{user_index.next}"
  )

  10.times do |post_index|
    Post.create(
      title:   "Title - #{post_index.next}",
      user_id: user.id
    )
  end
end
