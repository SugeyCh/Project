require('dotenv').config()

require('./controllers/connect.js')()
const connection = conn()

const express = require('express')  
const app     = express() 
const port    = process.env.PORT
const url     = process.env.URL
const parser  = require('body-parser')
const ejs     = require('ejs')
const path    = require('path')
const bcrypt  = require('bcrypt')
const fetch   = require('node-fetch')
const jwt     = require('jsonwebtoken')


const admin =[{
	nombre: 'Sugey',
	correo: 'chaconsugey2003@gmail.com',
	clave: 'S_Ch.15'
}]

app.use(parser.urlencoded({extended: true}))
app.set('views', path.join(__dirname, '../views'))
app.engine('ejs', ejs.__express)
app.set('view engine', 'ejs')
app.use(express.static('views'))

app.listen(port, function() {
	connection.connect(function(){
		console.log(`Server running on ${url+port}`)	
	})
})

app.get(process.env.ROOT_PATH, (req,res) => {
	res.render("register")
})

app.get(process.env.LOGIN, (req,res) => {
	res.render("login")
})

app.get(process.env.HOME_PATH, (req,res) => {
	res.render("principal")
})

app.get('/film', (req,res) => {
	
res.render("peliculas")

})

app.get('/perfil', async (req,res) => {
	var sql  = `SELECT * FROM film`
	var prom = await new Promise((resolve, reject) => {
		connection.query(sql, (err,data,fields) => {
		if(err) return reject(err)
		return resolve(data)
		})
	})
	res.render('profile', {prom})
})

app.get('/edit/:id', async (req,res) => {
	const{ id } = req.params
	sql = `SELECT * FROM film WHERE id='${id}';`
	var prom = await new Promise((resolve, reject) => {
		connection.query(sql, (err,data,fields) => {
		if(err) return reject(err)
		return resolve(data)
		})
	})
	res.render('edit', {user:prom[0]})
})

app.get('/create', (req,res) => {	
	res.render('create')
})

app.get('/error', (req, res) => {
	res.render('error')
})

app.post('/register/pro', (req,res) => {
	const { name, email, password } = req.body
	
	const payload ={
		nombre: name,
		correo: email,
		clave: password,
		niv_acc: "Usuario"
	}

	jwt.sign(payload, process.env.KEY, {algorithm:"HS256"}, (err,token) => {
		if (err) throw err 
		bcrypt.hash(password, 10, (err,hash) => {
			var sql = `INSERT INTO registro (nombre, correo, clave) VALUES ('${name}',
			'${email}', '${hash}');`
			connection.query(sql, (err,data,fields) => {
				if (err) throw err
				res.redirect('/login')
			})
		})
	})
})

app.post('/login/pro', async (req,res) => {
	const{ correo, clave } = req.body
	var sql = `SELECT * FROM registro WHERE correo='${correo}';`
	connection.query(sql, (err,data,fields) => {
		if (err) throw err
		if(data[0].correo=correo){
			bcrypt.compare(clave, data[0].clave, (err,comp) => {
				if(err) throw err
				if (comp==true) {
					console.log('Inicio de Sesión Exitoso')
				} else {
					console.log('Contraseña Incorrecta')
				}
			})
		}
	})
	
	bcrypt.hash(clave, 10, (err,hash) => {
		sql = `INSERT INTO login (correo, clave) VALUES ('${correo}', '${hash}');`
		connection.query(sql, (err,data,fields) => {	
			if(err) throw err
			res.redirect('/home')	
	})
		})	
	console.log('Bienvenido')
})


app.post('/save', (req,res) => {
	const{ nombre, genero, fecha } = req.body
	sql = `INSERT INTO film (nombre, genero, fecha_lanzamiento) VALUES ('${nombre}', '${genero}', '${fecha}');`
	connection.query(sql, (err,data,fields) => {
		if (err) throw err
		res.redirect('/perfil')
	})
})

app.post('/update', (req,res) => {
	const{ id, nombre, genero, fecha } = req.body
	sql = `UPDATE film SET nombre='${nombre}', genero='${genero}', fecha_lanzamiento='${fecha}' WHERE id='${id}';`
	connection.query(sql, (err,data,fields) => {
		if (err) throw err
		res.redirect('/perfil')
	})
})

app.get('/delete/:id', (req,res) => {
	const{ id } = req.params
	sql = `DELETE FROM film WHERE id='${id}';`
	connection.query(sql, (err,data,fields) => {
		if (err) throw err
	  res.redirect('/perfil')
	})
})

