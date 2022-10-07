const fila = document.querySelector('.container-carousel')
const pelis = document.querySelectorAll('.peli')

const flechaiz = document.getElementById('flecha-iz')
const flechade = document.getElementById('flecha-de')

flechade.addEventListener('click', () => {
  fila.scrollLeft += fila.offsetWidth

	const indicadorA = document.querySelector('.indicadores .activo')
	if(indicadorA.nextSibling){
		indicadorA.nextSibling.classList.add('activo')
		indicadorA.classList.remove('activo')
	}
})

flechaiz.addEventListener('click', () => {
  fila.scrollLeft -= fila.offsetWidth
	const indicadorA = document.querySelector('.indicadores .activo')
	if(indicadorA.previousSibling){
		indicadorA.previousSibling.classList.add('activo')
		indicadorA.classList.remove('activo')
	}
})

const numeroPagina = Math.ceil(pelis.length / 5)
for(let i = 0; i < numeroPagina; i++){
	const indicador = document.createElement('button')
	
	if(i === 0){
		indicador.classList.add('activo')
	}
	
	document.querySelector('.indicadores').appendChild(indicador)
	indicador.addEventListener('click', (e) => {
		fila.scrollLeft = i * fila.offsetWidth

		document.querySelector('.indicadores .activo').classList.remove('activo')
		e.target.classList.add('activo')
	})
}

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