require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  erb(:home)
end

get("/square/:type") do
  type = params.fetch("type")

  if type == "new"
    erb(:square)
  elsif type == "results"
      @number = params.fetch("number").to_f
      @square = @number * @number
      @square = @square.to_f
    erb(:square_results)
  end
end


get("/square_root/:type") do
  type = params.fetch("type")
  if type == "new"
    erb(:square_root)
  elsif type == "results"
    @user_number = params.fetch("user_number").to_f
    @square_root = Math.sqrt(@user_number)
    erb(:square_root_results)
  end
end

get("/payment/:type") do
  type = params.fetch("type")

  if type == "new"
    erb(:payment)
  elsif type == "results"
    @user_apr = params.fetch("user_apr").to_f
    @user_years = params.fetch("user_years").to_i
    @user_pv = params.fetch("user_pv").to_f

    @r = @user_apr / (100 * 12)
    @n = @user_years * 12
    @p = (@r * @user_pv) / (1 - (1 + @r) ** -@n)

    @user_apr = @user_apr.to_fs(:percentage, {:precision => 4})
    @user_pv = @user_pv.to_fs(:currency)
    @p = @p.to_fs(:currency)
    
    
    erb(:payment_results)
  end
end

get("/random/:type") do
  type = params.fetch("type")
  if type == "new"
    erb(:random)
  elsif type == "results"
    @user_min = params.fetch("user_min").to_f
    @user_max = params.fetch("user_max").to_f

    @rand = rand(@user_min..@user_max)

    erb(:random_results)
  end
end
