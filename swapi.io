doFile("json.io")

Swapi := Object clone do(
	baseUrl := "http://swapi.co/api/"
	peopleUrl := "#{baseUrl}people/" interpolate
	planetsUrl := "#{baseUrl}planets/" interpolate
	filmsUrl := "#{baseUrl}films/" interpolate
	speciesUrl := "#{baseUrl}species/" interpolate
	vehiclesUrl := "#{baseUrl}vehicles/" interpolate
	starshipsUrl := "#{baseUrl}starships/" interpolate

	getAllPeople := method(
		getData(peopleUrl)
	)

	getAllPlanets := method(
		getData(planetsUrl)
	)

	getAllFilms := method(
		getData(filmsUrl)
	)

	getAllSpecies := method(
		getData(speciesUrl)
	)

	getAllVehicles := method(
		getData(vehiclesUrl)
	)

	getAllStarships := method(
		getData(starshipsUrl)
	)

	getPerson := method(id,
		url := "#{peopleUrl}#{id}/" interpolate
		getData(url)
	)

	getPlanet := method(id,
		url := "#{planetsUrl}#{id}/" interpolate
		getData(url)
	)

	getFilm := method(id,
		url := "#{filmsUrl}#{id}/" interpolate
		getData(url)
	)

	getSpecies := method(id,
		url := "#{speciesUrl}#{id}/" interpolate
		getData(url)
	)

	getVehicle := method(id,
		url := "#{vehiclesUrl}#{id}/" interpolate
		getData(url)
	)

	getStarship := method(id,
		url := "#{starshipsUrl}#{id}/" interpolate
		getData(url)
	)

	getData := method(url,
		parseResponse(sendRequest(url))
	)

	sendRequest := method(url,
		HCUrl with(url) get
	)

	parseResponse := method(response,
		# Work on a list instead on a string 
		response := response asList
		# Remove first 4 weird characters from response
		response removeFirst
		response removeFirst
		response removeFirst
		response removeFirst
		# Remove also last 7 weird characters from response
		response removeLast
		#response removeLast
		#response removeLast
		#response removeLast
		#response removeLast
		#response removeLast
		#response removeLast
		# Get back to string and parse response
		response join parseJson
	)
)

# Swapi getAllPeople println
# Swapi getPerson(1) println
# Swapi getAllPlanets println
# Swapi getPlanet(1) println
# Swapi getAllFilms println
# Swapi getFilm(1) println
# Swapi getAllSpecies println
# Swapi getSpecies(1) println
# Swapi getAllVehicles println
# Swapi getVehicle(4) println
# Swapi getAllStarships println
# Swapi getStarship(9) println
