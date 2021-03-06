# write some jbuilder to return some json about a board
# it should include the board
#  - its lists
#    - the cards for each list

json.(@board, :id, :title)

json.lists @board.lists do |list|
  json.(list, :id, :title)
  json.cards list.cards do |card|
    json.(card, :id, :title )
  end
end
