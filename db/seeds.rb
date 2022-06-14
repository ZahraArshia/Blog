User.create!([
  {name: "Tom", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Mexico.", posts_counter: nil},
  {name: "Lilly", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Poland.", posts_counter: nil}
]),

Post.create!([
  {users_id: 10, title: 'Hello', text: 'This is my first post'}
  {users_id: 10, title: 'Hello2', text: 'This is my 2nd post'}
  {users_id: 10, title: 'Hello3', text: 'This is my 3rd post'}
  {users_id: 10, title: 'Hello4', text: 'This is my 4th post'}
]),

Comment.create!([
  {posts_id: 1, users_id: 10, text: 'comment 1'}
  {posts_id: 1, users_id: 10, text: 'comment 2'}
  {posts_id: 1, users_id: 10, text: 'comment 3'}
  {posts_id: 1, users_id: 10, text: 'comment 4'}
  {posts_id: 1, users_id: 10, text: 'comment 5'}
  {posts_id: 1, users_id: 10, text: 'comment 6'}
])
