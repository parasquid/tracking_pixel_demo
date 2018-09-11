require "sinatra"
require "base64"
require "json"

get "/" do
  erb :"index.html"
end

# this is the classic "pixel tracker" where the data is processed in the backend
get "/pixel.png" do
  puts "query string: #{request.query_string}"
  puts "cookies: #{JSON.pretty_generate(request.cookies)}"

  # this renders the actual 1x1 transparent pixel (hence the name pixel tracker)
  content_type "image/png"
  pixel_base64 = "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg=="
  Base64.decode64(pixel_base64)
end

# this is an iframe tracker which is more flexible, but requires the browser to execute js
get "/iframe" do
  content_type "text/html"
  %|<html>
      <head>
        <script>
          console.log("hello, world");
          console.log("query string: #{request.query_string}")
          console.log(`cookies: #{JSON.pretty_generate(request.cookies)}`)
        </script>
      </head>
    </html>
  |
end
