User.create!([
  {name: "Lilly", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Poland.", posts_counter: nil},
  {name: "Tom", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Mexico.", posts_counter: 4}
])
Post.create!([
  {title: "Hello2", text: "This is my second post", comments_counter: nil, likes_counter: nil, author_id: 1},
  {title: "Hello3", text: "This is my Third post", comments_counter: nil, likes_counter: nil, author_id: 1},
  {title: "Hello4", text: "This is my fourth post", comments_counter: nil, likes_counter: nil, author_id: 1},
  {title: "Hello", text: "This is my first post", comments_counter: 6, likes_counter: nil, author_id: 1}
])
Comment.create!([
  {author_id: 1, post_id: 2, text: "commemt1"},
  {author_id: 1, post_id: 2, text: "comment2"},
  {author_id: 1, post_id: 2, text: "comment3"},
  {author_id: 1, post_id: 2, text: "comment4"},
  {author_id: 1, post_id: 2, text: "comment5"},
  {author_id: 1, post_id: 2, text: "comment6"}
])
