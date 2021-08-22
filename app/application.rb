

class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        content_type = {'Content-Type' => 'text/html'}

        if req.path.include?("/items/")
            item_name = req.path.split("/").last
            item = @@items.find do |i|
                i.name == item_name
            end
                if item
                    resp.status = 200
                    resp.write (item.price)
                else
                    resp.status = 400
                    resp.write "Item not found"
                end

            else
                resp.status = 404
                resp.write "Route not found"

        end

        resp.finish
    
    end
end