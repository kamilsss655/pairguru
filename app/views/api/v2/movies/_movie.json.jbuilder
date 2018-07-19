json.extract! movie, :id, :title
json.genre do
  json.partial! "api/v2/genres/genre", genre: movie.genre
end
