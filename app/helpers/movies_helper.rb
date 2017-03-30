module MoviesHelper
  def data(type)
    url = "http://www.omdbapi.com/?t="
    title = self[:title].split(" ").join("+")
    type = type.to_s.capitalize
    (JSON.parse open(url + title).read)[type]
  end
end
