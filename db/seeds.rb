require 'faker'
Topic.destroy_all
Discussion.destroy_all
Post.destroy_all

puts 'Creating Topics...'

topicsList = ['Politics', 'News', 'Buy&Sell', 'Humor', 'Confessions']

topicsList.each do |item|
  topicInstance = Topic.new(
    name: item
  )
  topicInstance.save!

  puts "Creating 100 fake discussions for Topic #{item}"

  100.times do
    discussionInstance = Discussion.new(
      author: Faker::Name.name,
      title: Faker::Book.title,
      topic_id: topicInstance.id
    )
    discussionInstance.save!

    100.times do
      postInstance = Post.new(
        author: Faker::Name.name,
        message: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
        discussion_id: discussionInstance.id,
      )
      postInstance.save!
    end
  end
  puts 'Successfully created posts'
  puts 'Successfully created discussions'
  puts 'Successfully created discussions'
end
