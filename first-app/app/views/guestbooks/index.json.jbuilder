json.array!(@guestbooks) do |guestbook|
  json.extract! guestbook, :id, :title, :description
  json.url guestbook_url(guestbook, format: :json)
end
