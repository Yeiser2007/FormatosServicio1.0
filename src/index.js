const express = require('express');
const morgan = require('morgan');
const hbs = require('express-handlebars');
const path = require('path')
const flash = require('connect-flash');
const session = require('express-session');
const MySQLStore = require('express-mysql-session')(session );
const passport = require('passport');

const {database} = require('./keys');
//inicializamos
const app = express();
require('./lib/passport');

//configuraciones
app.set('port',process.env.PORT || 3000 );
app.set('views', path.join(__dirname, 'views'));
app.engine('hbs',hbs.engine({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'),'layouts'),
    partialsDir: path.join(app.get('views'),'Paginas'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}));
app.set('view engine', '.hbs');

//Midlewares
app.use(session({
    secret: 'faztmysqlnodesession',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore(database)
}));

app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());

//variables globales
app.use((req,res,next) =>{
    app.locals.success =  req.flash('success');
    app.locals.success =  req.flash('subir');
    app.locals.user = req.user;
    
next();
});

//rutas
app.use(require('./routes/login'));
app.use('/login',require('./routes/login'));
app.use('/aut',require('./routes/autenticacion'));
app.use('/',require('./routes/Principal'));
app.use('/Modificaciones/Personas',require('./routes/Principal'));
app.use('/3evaluacion',require('./routes/Principal'));
app.use('/1evaluacion',require('./routes/Principal'));
app.use('/4evaluacion',require('./routes/Principal'));
app.use('/5evaluacion',require('./routes/Principal'));
app.use('/6evaluacion',require('./routes/Principal'));
app.use('/AcercaDe',require('./routes/Principal'));
app.use('/Modificaciones',require('./routes/Altas')); 
app.use('/Usuario',require('./routes/User'));
// public
app.use(express.static(path.join(__dirname,'public')));


//empezar el servidor
app.listen(app.get('port'),() =>{
    console.log('servidor en el puerto',app.get('port'));
});
