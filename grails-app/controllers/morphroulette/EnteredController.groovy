package morphroulette

class EnteredController {

    def index() { 
    	def entereds = Entry.list()
    	[entereds:entereds]
    }
}
