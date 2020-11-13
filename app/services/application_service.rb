# base class for our service objects
calss ApplicationSercive 
    def self.call(*args, &block) 
        new(*args, &block).call
    end
end