class Own

    # add attribute readers for instance access
    attr_reader :user_id, :issue_id

    # connect to postgres
    # DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'searchstack_development'})
    if(ENV['DATABASE_URL'])
      uri = URI.parse(ENV['DATABASE_URL'])
      DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
    else
      DB = PG.connect(host: "localhost", port: 5432, dbname: 'searchstack_development')
    end


    # initialize options hash
    def initialize(opts = {})
        @id = opts["id"].to_i
        @user_id = opts["user_id"].to_i
        @issue_id = opts["issue_id"].to_i
    end

    def self.create(thisFave)
      results = DB.exec(
      <<-SQL
      INSERT INTO owns (user_id, issue_id) VALUES (
                #{thisFave["user_id"]},
                #{thisFave["issue_id"]}
      )
          RETURNING id, user_id, issue_id;
          SQL
      )
      if results.first == nil
        return { "added" => false }
      else
        return { "added" => true }
      end
    end
end
