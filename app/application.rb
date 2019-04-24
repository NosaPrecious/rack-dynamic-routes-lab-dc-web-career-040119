require 'pry'
class Application
  
  @@items_arr = [Item.new("Figs",3.42),Item.new("Pears",0.99)]
  
  def call(env)
    
    resp= Rack::Response.new
    req= Rack::Request.new(env)
  
    if req.path.match(/items/)
      item_str= req.path.split("/items/").last
      found_item= @@items_arr.find{|item| item.name == item_str}
      binding.pry
      resp.write 
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
  
end