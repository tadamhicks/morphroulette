<html>
<head>
<meta name="layout" content="main" />
<title></title>
<r:require module="export"/>
</head>
<body>


<div class="container">
<div id="slot_wrapper text-center">

<input type="text" class="search form-control input-lg">
				<ul id="slot">
					<g:each in="${entereds}" var="entered" status="i">
					<li>${entered.lastName}, ${entered.firstName}</li>
					</g:each>
				</ul>
			<div class="text-center spaces">
			<button type="button" id="random_location" class="btn btn-primary btn-lg">Pick a winner</button>
			<a href="/" class="btn btn-primary btn-lg">HOME</a>
			</div>
</div>

		<div class="vertical-align">

			<table class="table table-hover">
				<tr>
					<th class="text-center">First Name</th>
					<th class="text-center">Last Name</th>
					<th class="text-center">Email</th>
				</tr>
				<g:each in="${entereds}" var="entered" status="i">
					<tr>
						<td>${entered.firstName}</td>
						<td>${entered.lastName}</td>
						<td>${entered.email}</td>
					</tr>
			</g:each>
			</table>
			<g:link resources="entered" action="download" class="btn btn-primary btn-lg text-center">Download CSV</g:link>
			
		</div>
</div>


</body>

</html>