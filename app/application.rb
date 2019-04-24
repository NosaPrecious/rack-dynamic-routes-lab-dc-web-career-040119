class Application
  
  @@items_arr = [Item.new("pencil", 5), Item.new("book", 10), Item.new("eraser", 3)]
  
  def call(env)
    
    resp= Rack::Response.new
    req= Rack::Request.new(env)
  
    if req.path.match(/items/)
      item_str= req.path.split("/items/").last
      found_item= @@items_arr.find{|item| item.name == item_str}
      resp.write found_item.name
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
  
end