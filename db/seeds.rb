10.times do |blog|
  Blog.create!(
      title: "My Blog Post #{blog}",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
      title: "Rails #{skill}",
      percent_utilized: 15
    )
end

puts "5 skills created"

9.times do |portfolio_item|
  Portfolio.create!(
      title: "Portfolio title: #{portfolio_item}",
      subtitle: "My great service",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      main_image: "https://placeholdit.imgix.net/~text?txtsize=33&txt=600×400&w=600&h=400",
      thumb_image: "https://placeholdit.imgix.net/~text?txtsize=33&txt=350×200&w=350&h=200"
    )
end
puts "9 portfolio items created"