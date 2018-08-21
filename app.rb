require "sinatra"
require "base64"
require "json"

get "/" do
  erb :"index.html"
end

get "/pixel.png" do
  puts "query string: #{request.query_string}"
  puts "cookies: #{JSON.pretty_generate(request.cookies)}"

  # this renders the actual 1x1 transparent pixel (hence the name pixel tracker)
  content_type "image/png"
  Base64.decode64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==")
end