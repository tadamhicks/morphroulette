		<g:formRemote name="subForm" url="[controller: 'entry', action: 'save']" class="vertical-align" update="entering">
		<h1>Enter to Win!</h1>
			<div class="form-group">
				<g:textField name="firstName" placeholder="First Name" class="form-control input-lg" />
			</div>
			<div class="form-group">
				<g:textField name="lastName" placeholder="Last Name" class="form-control input-lg" />
			</div>
			<div class="form-group">
				<g:textField name="email" placeholder="Email" class="form-control input-lg" />
			</div>
			<div class="form-group">
				<g:submitButton class="btn btn-primary btn-lg" name="Submit" />
			</div>
	</g:formRemote>