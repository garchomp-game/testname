require 'rack'
require 'mysql2'
require_relative 'database'


class UserT < EcDatabase
  def initialize(params)
    @params=params
    super
  end

  def check_params?
    if @params["name"].empty? || @params["year"].empty? || @params["month"].empty? || @params["day"].empty? || @params["tell"].empty?
      false
    else
      true
    end
  end
  def view_helper
    view_params = {}
    view_params["name"] = @params["name"]
    view_params["tell"] = @params["tell"]
    view_params["comment"] = @params["comment"]
    view_params["birthday"] = @params["year"] + "年" + @params["month"] + "月" + @params["day"] + "日"
    case @params["type"]
    when "1"
      view_params["type"] = "エンジニア"
    when "2"
      view_params["type"] = "営業"
    when "3"
      view_params["type"] = "その他"
    end
    view_params
  end
  def login

     x=@client.prepare(%q{select * from user_t where mail=? and password=?; })
     return x.execute(@params["id"],@params["pass"])
  end

  def view_helpers
    view_params = {}
    view_params["name"] = @params["name"]
    view_params["tell"] = @params["tell"]
    view_params["comment"] = @params["comment"]
    @birh=@params["newdate"].to_s
    view_params["year"]=@birh.slice(0,4)
    view_params["month"]=@birh.slice(5,2)
    view_params["day"]=@birh.slice(8,2)
    case @params["type"]
    when 1
      view_params["type"] = "エンジニア"
    when 2
      view_params["type"] = "営業"
    when 3
      view_params["type"] = "その他"
    end
    view_params
  end
  def insert
    statement = @client.prepare(%q{insert into user_t(name,password,mail,address,newDate) VALUES(?,?,?,?,?)})
    @result = statement.execute(@params["name"], @params["pass"], @params["mail"], @params["address"],DateTime.now)
  end
  def insert_price(total,name)
    statement = @client.prepare(%q{update user_t set total=total+? where name=?})
    @result = statement.execute(total,name)
  end
  def update
    statement = @client.prepare(%q{update user_t set name=?,password=?,mail=?,address=?,newDate=? where userID=? })
    @result = statement.execute(@params["name"], @params["password"], @params["mail"], @params["address"],DateTime.now,@params["id"])
  end
  def update_count(total,id)
    statement = @client.prepare(%q{update user_t set total=? where userID=? })
    @result = statement.execute(total,id)
  end
  def delete(n)
    x=@client.prepare(%q{delete from user_t where userID=?;})
    x.execute('#{n}')
  end
  def mydelete_result(n)
    x=@client.prepare(%q{delete from user_t where name=?;})
    x.execute(n)
  end
  def delete_cart
    @client.query(%q{TRUNCATE table items;})
  end
  def complete_insert(n,m)
    statement = @client.prepare(%q{insert into complete VALUES(?,?)})
    begin
      @result = statement.execute(n,m)
    rescue
      nil
    end
  end
  def delete_item(n)
    x=@client.prepare(%q{delete from items where item=?;})
    x.execute(n)
  end
  def search_all
    @client.query(%q{select * from user_t;})
  end
  def search_complete
    @client.query(%q{select * from complete;})
  end
  def search_user(n)
    begin
      x=@client.prepare(%q{select * from user_t where name like ?;})
      x.execute("%#{n}%")
    rescue
      nil
    end
  end
  def search_name(n)
    begin
      x=@client.prepare(%q{select * from items where name like ?;})
      x.execute("%#{n}%")
    rescue
      nil
    end
  end
  def search
    #SQLを動的に生成
    query = "select * from user_t"
    where_flag = false
    judge1=false
    if !@params["name"].empty?
      query += " WHERE name like ?"
      where_flag = true;
      judge1=true
    end
    judge2=false
    if @params["type"].to_i != 0
      query += where_flag ? " AND type like ?" : " WHERE type like ?"
      where_flag = true;
      judge2=true
    end
    judge3=false
    if !@params["year"].empty?
      query += where_flag ? " AND birthday like ?" : " WHERE birthday like ?"
      judge3=true
    end

    statement = @client.prepare(query)
    total=""

    if judge1==true
      total+="#{@params["name"]} "
    end
    if judge2==true
      total+="#{@params["type"].to_i} "
    end
    if judge3==true
      total+="%#{@params["year"].to_i}%"
    end
    totals=total.split

    @result = statement.execute(*totals)
  end

  def search_by_id
    query = "select * from user_t where userID = ?"
    statement = @client.prepare(query)
    @result = statement.execute(@params["userID"])

    # 主キーであるuserIDの一致検索のため、戻り値は範囲オブジェクトでなく最初の一件だけでよい
    @result.first
  end
end
