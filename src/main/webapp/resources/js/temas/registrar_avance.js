window.Laravel = "";
var vm = new Vue(
{
	el: '#app',

	data: {
		hayTemasExtras: false,
		temasExtras: [],
		nuevoTemaExtra: "",
	},

	methods: {
		selectTema: function(id) {
			var checkbox = document.getElementById('tema_' + id);
			var tema = document.getElementById('span_' + id);
			tema.innerHTML = (checkbox.dataset.cumplido == 0) ? 'Si' : 'No';
			checkbox.dataset.cumplido = (checkbox.dataset.cumplido == 1) ? 0 : 1;
		},

		agregarTemaExtra: function() {
			if (this.nuevoTemaExtra != "") {
				this.temasExtras.push(this.nuevoTemaExtra);
				this.nuevoTemaExtra = "";
			}
		},
	},
});