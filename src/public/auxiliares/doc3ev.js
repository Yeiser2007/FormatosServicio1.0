    s
    function generarPDF() {
        console.log("2si entra a logf")
	const myInput = document.getElementById("NombreEvaluador");
    const nombre = myInput.value;
    console.log(nombre);

	const myInput2 = document.getElementById("dt");
    const asignacion = myInput2.value;

	const myInput3 = document.getElementById("ct");
    const alumno = myInput3.value;

	const myInput4 = document.getElementById("tuto");
    const proyecto = myInput4.value;

	const myInput5 = document.getElementById("myInput5");
    const calf1 = myInput5.value;

	const myInput6 = document.getElementById("myInput6");
    const calf2 = myInput6.value;

	const myInput7 = document.getElementById("myInput7");
    const calf3 = myInput7.value;

	const myInput8 = document.getElementById("myInput8");
    const calf4 = myInput8.value;

	const myInput9 = document.getElementById("myInput9");
    const calf5 = myInput9.value;

	const myInput10 = document.getElementById("myInput10");
    const calf6 = myInput10.value;

	const myInput11 = document.getElementById("myInput11");
    const calf7 = myInput11.value;

	const myInput12 = document.getElementById("myInput12");
    const calf8 = myInput12.value;

	const myInput13 = document.getElementById("myInput13");
    const calf9 = myInput13.value;

  var num1=parseFloat(calf1);
  var num2=parseFloat(calf2);
  var num3=parseFloat(calf3);
  var num4=parseFloat(calf4);

  var num5=parseFloat(calf5);
  var num6=parseFloat(calf6);
  var num7=parseFloat(calf7);
  var num8=parseFloat(calf8);
  var num9=parseFloat(calf9);

	const summa = num1+num2+num3+num4;
	const total1= (summa*7)/40;

	const summa2= num5+num6+num7+num8+num9;
	const total2=(summa2*3)/50;

	const calfinal=(total1+total2).toFixed(1);

  //console.log(summa);
  //console.log(summa2);

	const myInput14 = document.getElementById("myInput14");
  const observaciones = myInput14.value;

	//Obtener el dia 
	const today = new Date();
	const day = today.getDate();

	//Obtener el mes 
	const months = ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"];
	const month = months[today.getMonth()];

	//Obtener el año
	const year = today.getFullYear();


  var imageUrl1 = 'logofac.png';
  var imageUrl2 = 'UAEM.png';

  // Obtener las imágenes en formato base64
  var promesaImagen1 = obtenerImagenBase64(imageUrl1);
  var promesaImagen2 = obtenerImagenBase64(imageUrl2);

  Promise.all([promesaImagen1, promesaImagen2])
        .then(function (resultados) {
          var base64data1 = resultados[0];
          var base64data2 = resultados[1];
        

	//Agregar Encabezado
	var header = {
        columns: [
          {
          image:base64data2,
            width: 50,
            margin: [0, 10, 0, 0]
            
          },
		  // Texto dividido en dos renglones
          {text: ['DOCTORADO EN CIENCIAS DE LA INGENIERÍA\n','FACULTAD DE INGENIERÍA'], 
		  alignment: 'center',fontSize:9,margin: [0, 10, 0, 10]}, //0,10,0,10
          {
         image:base64data1,
         width: 55,
         margin: [0, 10, 0, 0]
          }
        ],
        margin: [70, 15, 90, 15]
      };



	// Definición del documento
    var docDefinition = {
		
  pageSize: 'LETTER',
  pageMargins: [70, 50, 70, 30], // margen
  header: header,
  content: [
    // Título
    { text: 'FACULTAD DE INGENIERÍA', style: 'title',alignment: 'center',
	fontSize:12, 
	margin: [5, 5, 5, 5] },

	//Segundo Semestre
	{
      columns: [
        { 
          text: [
            { text: 'Actividades de investigación: ', alignment: 'center', bold: true,fontSize:12},
            {text: '2° Semestre', alignment: 'center',fontSize:12} 
          ],
          margin: [0, 0, 5, 10]
        }
      ]
    },

    

	//Nombre del Evaluador
	{
      columns: [
        { 
          
          text: [
          
            { text: 'NOMBRE DEL EVALUADOR: ', alignment: 'left', bold: true,fontSize:11},
        
            {text: nombre+'\n', alignment: 'left',fontSize:11} 
          ],
          margin: [0, 0, 5, 5]
        }
      ]
    },

	//Asignación dentro del comite tutoral
	{
      columns: [
        { 
          text: [
            { text: 'ASIGNACIÓN DENTRO DEL ', alignment: 'left',fontSize:11},
			{text: 'COMITÉ TUTORAL: ', alignment: 'left', bold: true,fontSize:11} ,
            {text: asignacion, alignment: 'left',fontSize:11} 
          ],
          margin: [0, 0, 5, 5]
        }
      ]
    },

	//Nombre del Alumno
	{
      columns: [
        { 
          text: [
            { text:'NOMBRE DEL ALUMNO: ', alignment: 'left',fontSize:11},
            {text: alumno, alignment: 'left',fontSize:11} 
          ],
          margin: [0, 0, 5, 5]
        }
      ]
    },

	//TÍTULO DEL PROYECTO:
	{
      columns: [
        { 
          text: [
            { text:'TÍTULO DEL PROYECTO: ', alignment: 'left',fontSize:11},
            {text: proyecto, alignment: 'left',fontSize:11} 
          ],
          margin: [0, 0, 10, 10]
        }
      ]
    },

	//I. Trabajo Escrito (70%).
		{
      columns: [
        { 
          text: [
            { text:'I. Trabajo Escrito (70%). ', alignment: 'left', bold: true,fontSize:11},
            {text: 'Se califica forma, fondo e integración de los primeros capítulos y su capítulo de avance, del trabajo escrito de tesis.', alignment: 'left',fontSize:11} 
          ],
          margin: [0, 0, 0, 0]
        }
      ]
    },
	
    // Primer Tabla 
    {
      style: 'table',
	  
      table: {
        headerRows: 1,
		alignment: 'center',
        widths: [290, 90],
		
        body: [
          // Encabezados de tabla
          [
            { text: 'Puntos a Evaluar', style: 'tableHeader' ,fontSize:11},
            { text: 'Calificación(1-10)', style: 'tableHeader',fontSize:11 }
          ],
          // Datos de tabla
          [
            { text: 'Introducción (parte del protocolo)' ,fontSize:11},
            { text: calf1 ,alignment: 'center' ,fontSize:11}
         
          ],
          [
            { text: 'Estado del Arte' ,fontSize:11},
            { text: calf2, alignment: 'center',fontSize:11}
          ]
			,
		  [
            { text: 'Marco Teórico' ,fontSize:11},
            { text: calf3,alignment: 'center' ,fontSize:11}
          ],
		  [
            { text: 'Tabla comparativa entre el Plan de Trabajo ' +
			'semestral y las actividades realizadas (Reporte de Trabajo semestral)',fontSize:11 },
            { text: calf4 , alignment: 'center',fontSize:11}
          ]

        ]
      }
    },

	//II. Presentación Oral (30%). 
	{
      columns: [
        { 
          text: [
            { text:'II. Presentación Oral (30%). ', alignment: 'left', bold: true,fontSize:11},
            {text: 'Se califica la presentación y el dominio de lo presentado.', alignment: 'left',fontSize:11} 
          ],
          margin: [0, 0, 0, 0]
        }
      ]
    },

   // Segunda Tabla 
   {
      style: 'table',
      table: {
        headerRows: 1,
        widths: [200, 90],
        body: [
          // Encabezados de tabla
          [
            { text: 'Puntos a Evaluar', style: 'tableHeader' ,fontSize:11},
            { text: 'Calificación(1-10)', style: 'tableHeader',fontSize:11 }
          ],
          // Datos de tabla
          [
            { text: 'Introducción',fontSize:11 },
            { text: calf5,alignment: 'center',fontSize:11 }
         
          ],
          [
            { text: 'Estado del Arte',fontSize:11 },
            { text: calf6 ,alignment: 'center',fontSize:11}
          ]
			,
		  [
            { text: 'Marco Teórico' ,fontSize:11},
            { text: calf7 ,alignment: 'center',fontSize:11}
          ],
		  [
            { text: 'Avances: propuestas y resultados',fontSize:11 },
            { text: calf8 ,alignment: 'center',fontSize:11}
          ],

		  [
            { text: 'Comparativo entre cronograma inicial  ' +
			'y actividades realizadas' ,fontSize:11},
            { text: calf9,alignment: 'center' ,fontSize:11}
          ]

        ]
      }
    },

	//El alumno deberá tener un avance entre el 25% y el 35% de su investigación.

	{
      columns: [
        { 
          text: [
            { text:'El alumno deberá tener un avance entre el 25% y el 35% de su investigación.\n\n', alignment: 'left',fontSize:11},
            {text: 'CALIFICACION ASIGNADA (ESCALA DE 0 A 10): ', alignment: 'left', bold: true,fontSize:11} ,
			{text: calfinal+'\n\n', alignment: 'left',fontSize:11} ,
     // {text: calfinal, alignment: 'left',fontSize:11,margin: [0, 0, 0, 0] },
     // { text: '_____________\n\n', alignment: 'center',margin: [0, 10, 10, 0] },
			{text: 'Comentarios y Observaciones:', alignment: 'left', bold: true,fontSize:11} 

          ],
          margin: [0, 0, 10, 0]
        }
      ]
    },

	//Ultimo Cuadro 
	{
      style: 'table',
      table: {
        headerRows: 1,
        widths: [400],
        body: [
          [
            { text: observaciones ,fontSize:11}
          ]

        ]
      }
    },

	//Imprimir la Fecha

	{
      columns: [
        { 
          text: [
		   //{ text: '\n\n' },
            { text:'Toluca, México a ', alignment: 'center'},
            {text: day, alignment: 'center'} ,
			{text: ' de ', alignment: 'center'} ,
			{text: month, alignment: 'center'},
			{text: ' de ', alignment: 'center'} ,
			{text: year, alignment: 'center'}
          ],
          margin: [0, 0, 10, 0]
        }
      ]
    },
    // Espacio para firma
    { text: '\n\n' },
    { text: '__________________________', alignment: 'center' },
    { text: 'Firma', alignment: 'center', margin: [0, 10, 0, 0] }
  ],
  
  // Estilos
  styles: {
    header: { fontSize: 18, bold: true, margin: [0, 0, 0, 10] }, //cambie el ultimo cero, tenia 10
    title: { fontSize: 16, bold: true },
    table: { margin: [35, 12, 70, 12] },
    tableHeader: { bold: true, fillColor: '#EEEEEE' }
  }
};

// Crear PDF
pdfMake.createPdf(docDefinition).open();
}
    )}
  


 function obtenerImagenBase64(url) {
      return new Promise(function (resolve, reject) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.responseType = 'blob';

        xhr.onload = function () {
          if (xhr.status === 200) {
            var reader = new FileReader();
            reader.onloadend = function () {
              resolve(reader.result);
            };
            reader.readAsDataURL(xhr.response);
          } else {
            reject(new Error('Error al obtener la imagen'));
          }
        };

        xhr.onerror = function () {
          reject(new Error('Error al obtener la imagen'));
        };

        xhr.send();
      });
    }