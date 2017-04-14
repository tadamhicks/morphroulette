package morphroulette

class EntryController {

    def index() { }
    def save() {
    	def entry = new Entry(params)
    	entry.save()
    	render template: 'entered'
    }
}
