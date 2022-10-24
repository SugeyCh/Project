const ObPeli = async() => {
	try{
	const res  = await axios.get('https://api.themoviedb.org/3/movie/popular', {
		params: {
			//api_key: '2b7f1c822b96be0f3567e81276f79e78',
			language: 'es-MX'
		},
		headers: {
			'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYjdmMWM4MjJiOTZiZTBmMzU2N2U4MTI3NmY3OWU3OCIsInN1YiI6IjYzNDU4OTQ1NzFmZmRmMDA3YTI1ZjA0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OzVu8wWA16cCpRceN27lSd1lcaTyMP5qyGI076Zmai8'
		}
	})

		console.log(res)
	} catch(err){
		console.log(err)
	}

}

ObPeli() 