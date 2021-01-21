class Pokemon
    #attr_accessor : you can read and change the instance variables
    attr_accessor :id, :name, :type, :db
    #initialize meaning here!
    # => it will allow to create objects, in this case, Pokemon, with arguments :id,name,typ,db
    def initialize (id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
        #arguments passed into initialize aren't automatically saved anywhere.
        # by assining values of arguments to the instance variables will let you access them later
    end

    def self.save(name, type, db)
       
        sql = <<-SQL
       INSERT INTO pokemon (name, type)
       VALUES (?, ?)
       SQL
       db.execute(sql, name, type)

    end


    def self.find(id_num, db)
        result = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).first
        Pokemon.new(id: result[0], name: result[1], type: result[2], db: db)
    end
end
