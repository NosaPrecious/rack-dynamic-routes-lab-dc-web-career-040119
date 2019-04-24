class Application
  
  @@items_arr = [Item.new("pencil", 5.23), Item.new("book", 7.96), Item.new("eraser", 6.89)]
  
  def call(env)
    
    resp= Rack::Response.new
    req= Rack::Request.new(env)
  
    if req.path.match(/item/)
      item_str= req.path.split("/item/").last
      found_item= @@items_arr.find{|item| item.name == item_str}
      resp.write found_item.price
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
  
end