const fila  = document.querySelector('.container-carousel')
const pelis = document.querySelectorAll('.peli')

pelis.forEach((peli) => {
	peli.addEventListener('mouseenter', (e) => {
		const element = e.currentTarget
		setTimeout(() => {
			pelis.forEach(peli => peli.classList.remove('hover'))
			element.classList.add('hover')
		}, 300)
	})
})

fila.addEventListener('mouseleave', () => {
	pelis.forEach(peli => peli.classList.remove('hover'))
})