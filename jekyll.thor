require "stringex"
class Jekyll < Thor
  desc "post", "create a new post"
  method_option :editor, :default => "subl"
  def post(*title)
    title = title.join(" ")
    date = Time.now.strftime('%Y-%m-%d')
    filename = "_posts/#{date}-#{title.to_url}.md"

    if File.exist?(filename)
      abort("#{filename} already exists!")
    end

    puts "Creating new post: #{filename}"
    open(filename, 'w') do |post|
      post.puts "---"
      post.puts "layout: post"
      post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
      post.puts "date: #{date}"
      post.puts "categories:"
      post.puts " -"
      post.puts "---"
    end

    system(options[:editor], filename)
  end

  desc "page", "Create a new page"
  method_option :editor, :default => "subl"
  def page(*title)
    title = title.join(" ")
    filename = "#{title.to_url}.md"
    if File.exist?(filename)
      abort("#{filename} already exists!")
    end

    puts "Creating new page: #{filename}"
    open(filename, 'w') do |page|
      page.puts "---"
      page.puts "layout: page"
      page.puts "title: #{title.gsub(/&/,'&amp;')}"
      page.puts "permalink: /#{filename}/"
      page.puts "---"
    end

    system(options[:editor], filename)
  end
end