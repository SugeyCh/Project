require('./controllers/connect.js')()
const connection = conn()

const express = require('express')  
const app     = express() 
const port    = process.env.PORT
const url     = procces.env.URL
const parser  = require('body-parser')
const ejs     = require('ejs')
const path    = require('path')
const bcrypt  = require('bcrypt')
const fetch   = require('node-fetch')
const jwt     = require('jsonwebtoken')

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

app.get(process.env.HOME, (req,res) => {
	res.render("principal")
})

app.post('/register/pro', (req,res) => {
	const { name, email, password } = req.body
	bcrypt.hash(password, 10, (err,hash) => {
		if (err) throw err
		var sql = `INSERT INTO registro (nombre, correo, clave) VALUES ('${name}',
		'${email}', '${hash}');`
		connection.query(sql, (err,data,fields) => {
			if (err) throw err
			console.log('Registro Exitoso')
		})
	})
})

app.post('/login/pro', (req,res) => {
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
			console.log('Exitoso Inicio')
		})
	})	
	console.log('Bienvenido')
})