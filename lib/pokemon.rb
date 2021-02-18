class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db
    end 

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    end
        # sql = <<-SQL
        #   INSERT INTO pokemon (name, type, db) 
        #   VALUES (?, ?)
        # SQL
    
        # DB[:conn].execute(sql, self.name, self.type, self.db)
    
        # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    

    def self.find(id, db)
        poke = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
        x = Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db: db)
    end
        # sql = <<-SQL
        #   SELECT *
        #   FROM pokemon
        #   WHERE id = ?
        #   LIMIT 1
        # SQL
        
        # DB[:conn].execute(sql, name).map do |row|
        #   self.new_from_db(row)
        # end.first
    

end
