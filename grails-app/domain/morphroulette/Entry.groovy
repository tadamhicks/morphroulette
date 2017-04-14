package morphroulette

class Entry {
	String firstName
	String lastName
	String email

	static constraints = {
		firstName nullable: false
		lastName nullable: false
		email nullable: false
		email(unique: ['firstName', 'lastName'])

	}
}